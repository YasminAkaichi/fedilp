import flwr as fl
from flwr.common.logger import log
from logging import DEBUG
from typing import List
from andante.program import AndanteProgram 
from andante.collections import OrderedSet
import  helper
from andante.logic_concepts import Clause

#Load DATA and MODEL
ilp = AndanteProgram.build_from("data/medical/data_part2.pl")

# Define Flower client
class FlowerClient(fl.client.NumPyClient):
    def __init__(self):
        self.ilp = ilp
        self.H: List[Clause] = []
    def get_parameters(self, config):
        log (DEBUG, "getting parameters using get parameters")
        if self.ilp.results is None:
            #return model.get_weights()
            self.ilp.results = OrderedSet([
            " :- ."])
        return helper.get_parameters(self.ilp.results)
    def fit(self, parameters, config):
        #model.set_weights(parameters)
        helper.set_parameters(self.ilp,parameters)
        #model.fit(x_train, y_train, epochs=1, batch_size=32)
        log(DEBUG, "Performing training on local dataset")
        self.H = self.ilp.induce(update_knowledge=True, logging=True, verbose=1)
        log(DEBUG, "Finished training on rules") 
        #return model.get_weights(), 10, {}
        return helper.get_parameters(self.ilp.results), 10,{}

    def evaluate(self, parameters, config):
        helper.set_parameters(self.ilp, parameters)
        #model.set_weights(parameters)
        #loss, accuracy = model.evaluate(x_test, y_test)
        #return loss, len(x_test), {"accuracy": accuracy}
        log(DEBUG, "Evaluating rules")
        #return 0.5, 10, {"accuracy": 0.95}
        positive_examples = self.ilp.examples['pos']
        negative_examples = self.ilp.examples['neg']
        background_knowledge = self.ilp.knowledge 
        induced_clauses = self.H
        
        results = []
        for clause in induced_clauses:
            coverage_score = helper.evaluate_clause_coverage(clause, positive_examples, negative_examples, background_knowledge)
            results.append((clause, coverage_score))
        
        # Assuming the first clause and its score for simplicity
        if results:
            first_clause, score = results[0]
            positive_entailed = score['positive_entailed']
            positive_not_entailed = score['positive_not_entailed']
            negative_entailed = score['negative_entailed']
            negative_not_entailed = score['negative_not_entailed']
            coverage_score = score['score']
            m_estimate = score['m_estimate']
            
            # Define loss and accuracy based on ILP evaluation results
            loss = negative_entailed / (negative_entailed + negative_not_entailed + 1e-10)  # Just an example of loss calculation
            accuracy = positive_entailed / (positive_entailed + positive_not_entailed + 1e-10)
            
            return loss, len(results), {"m_estimate": m_estimate}
        else:
            return float('inf'), len(results), {"m_estimate": 0}

# Start Flower client
fl.client.start_numpy_client(
        server_address="127.0.0.1:8080", 
        client=FlowerClient()
)