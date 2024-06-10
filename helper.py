import torch
import numpy as np
#from transformers import GPT2Tokenizer
from typing import  Callable, Dict, List, Optional, Tuple, Union
import importlib
import andante.collections  # adjust according to your actual module import
importlib.reload(andante.collections)
from andante.collections import OrderedSet
from andante.logic_concepts import Clause, Goal
from andante.knowledge import Knowledge
from andante.solver import AndanteSolver

from flwr.common import (
    Parameters,
    Code,
    EvaluateIns,
    EvaluateRes,
    FitIns,
    FitRes,
    GetParametersIns,
    GetParametersRes,
    Status,
    ndarrays_to_parameters,
    parameters_to_ndarrays,
    ndarray_to_bytes,
)
import numpy as np
import pickle
from io import BytesIO
from typing import List
from andante.program import AndanteProgram 
from andante.solver import AndanteSolver
from andante.parser import Parser
from andante.collections import OrderedSet

def text_to_tensor(rules: str|OrderedSet) -> torch.Tensor:
    """Convert a text or an OrderedSet to PyTorch tensor."""
    if isinstance(rules,str):
        tokens = [ord(char) for char in rules]
    elif isinstance(rules,OrderedSet):
        text = OrderedSet.__str__(rules)
        tokens = [ord(char) for char in text]
    else:
        raise ValueError("Input must be either a string or an OrderedDict")
    # Convert the tokens to a PyTorch tensor
    tensor = torch.tensor(tokens)
    return tensor

def tensor_to_parameters(tensor:torch.tensor) -> Parameters:
    """Convert a PyTorch tensor to Parameters."""
    # Serialize the tensor to bytes
    tensor_bytes = ndarray_to_bytes(tensor)
    # Create Parameters instance
    parameters = Parameters(tensors=[tensor_bytes], tensor_type="tensor_type")
    return parameters

#not used
def parameters_to_tensor(parameters:Parameters) -> torch.tensor:
    """Convert Parameters to PyTorch tensor."""
    # Deserialize the bytes to numpy array
    tensor_numpy = torch.from_numpy(bytearray(parameters.tensors[0])).view(-1)

    # Convert numpy array to PyTorch tensor
    tensor = tensor_numpy.type(parameters.tensor_type)
    
    return tensor

def tensor_to_text(tensor: torch.Tensor) -> str:
    """Convert a PyTorch tensor to text."""
    # Convert the tensor to a list of integers
    token_ids = tensor.tolist()   
    # Flatten the nested list structure
    #flattened_token_ids = [item for sublist in tensor.tolist() for item in sublist]
    # Flatten the list if it's nested
    if any(isinstance(sublist, list) for sublist in token_ids):
        token_ids = [item for sublist in token_ids for item in sublist]
    # Decode the token IDs into characters
    text = ''.join([chr((token_id)) for token_id in token_ids])
    return text


def get_parameters(results:OrderedSet) -> List[np.ndarray]:
    """ Convert parameters to NumPy arrays """
    if results is None:
        return None
    else:
        #convert orderest Set to text then to tensor
        tensor = text_to_tensor(results)
        #convert tensors to parameters
        parameters = tensor_to_parameters(tensor)
        return parameters_to_ndarrays(parameters)


def text_to_ordered_set(text: str) -> 'OrderedSet':
    lines = text.strip().split('\n')
    ordered_set = OrderedSet()
    for line in lines:
        line = line.strip()
        if line:
            ordered_set.add(line)
    return ordered_set

def set_parameters(ilp: AndanteProgram , parameters: List[np.ndarray]):
    """ Set the parameters for the ILP """
    if parameters and len(parameters) > 0:
        array_value = parameters[0]
    else:
        array_value = parameters
    #convert NDarray parameters to tensors
    tensor_value = torch.tensor(array_value)
    #convert tensors to text 
    text = tensor_to_text(tensor_value)
    #convert text to OrderedSet 
    ilp.results = text_to_ordered_set(text)


def aggregate_fedilp(results: List[Tuple[np.ndarray, int]]) -> np.ndarray:
    """Do union to rules"""
    # step 1 convert list of ndarrays to tensors 
    tensors = [torch.tensor(result[0]) for result in results]
    # step 2 convert tensors to text 
    texts = [tensor_to_text(tensor) for tensor in tensors]
    # step 3 convert text to OrderedSet 
    ordered_sets= [OrderedSet.text_to_ordered_set(text) for text in texts]
    # step 4 do the union to rules 
    union_set = OrderedSet()
    for ordered_set in ordered_sets:
        union_set |= ordered_set
    # step5: convert orderedset to text then to tensors then to ndarray 
    text_union = OrderedSet.__str__(union_set)
    #step6: convert text back to tensors
    tensor_union = text_to_tensor(text_union)
    #step7: convert tensors back to ndarrays ( maybe to ndarray directly ? but before to parameters) 
    tensor_parameters = tensor_to_parameters(tensor_union)
    ndarrays = parameters_to_ndarrays(tensor_parameters) 
    return ndarrays

def evaluate_clause_coverage(clause, positive_examples, negative_examples, background_knowledge, m=5, p_0=0.5):
    """
    Evaluate the coverage of a clause against positive and negative examples.

    Parameters:
    - clause (Clause): The clause to evaluate.
    - positive_examples (list of Clause): List of positive examples to test.
    - negative_examples (list of Clause): List of negative examples to test.
    - background_knowledge (Knowledge): Background knowledge to utilize during evaluation.
    - m (int): Smoothing parameter for the m-estimate calculation.
    - p_0 (float): Prior estimate of the proportion of positive examples.
    Returns:
    - dict: A dictionary containing the coverage information:
      - "positive_entailed": Number of positive examples entailed by the clause.
      - "positive_not_entailed": Number of positive examples not entailed by the clause.
      - "negative_entailed": Number of negative examples entailed by the clause.
      - "negative_not_entailed": Number of negative examples not entailed by the clause.
      - "score": The calculated \(P - N\) score.
      - "m_estimate": The calculated m-estimate.
    """
    assert isinstance(clause, Clause), "The clause parameter must be an instance of Clause"
    assert isinstance(background_knowledge, Knowledge), "The background_knowledge parameter must be an instance of Knowledge"

    # Initialize counts for the results
    positive_entailed = 0
    positive_not_entailed = 0
    negative_entailed = 0
    negative_not_entailed = 0

    # Initialize the solver
    solver = AndanteSolver()

    # Check positive examples
    for example in positive_examples:
        goal = Goal([example.head])  # Wrap example head in a Goal
        is_entailed = solver.succeeds_on(goal, background_knowledge)
        if is_entailed:
            positive_entailed += 1
        else:
            positive_not_entailed += 1

    # Check negative examples
    for example in negative_examples:
        goal = Goal([example.head])  # Wrap example head in a Goal
        is_entailed = solver.succeeds_on(goal, background_knowledge)
        if is_entailed:
            negative_entailed += 1
        else:
            negative_not_entailed += 1

    # Calculate the \(P - N\) score
    score = positive_entailed - negative_entailed

    # Calculate the m-estimate
    total_covered = positive_entailed + negative_entailed
    m_estimate = (positive_entailed + m * p_0) / (total_covered + m) if total_covered > 0 else 0

    

    # Display the results
    print(f"Positive examples entailed: {positive_entailed}")
    print(f"Positive examples not entailed: {positive_not_entailed}")
    print(f"Negative examples entailed: {negative_entailed}")
    print(f"Negative examples not entailed: {negative_not_entailed}")
    print(f"Coverage score (P - N): {score}")
    print(f"m-estimate: {m_estimate}")

    return {
        "positive_entailed": positive_entailed,
        "positive_not_entailed": positive_not_entailed,
        "negative_entailed": negative_entailed,
        "negative_not_entailed": negative_not_entailed,
        "score": score,
        "m_estimate": m_estimate
    }