import flwr as fl
from flwr.common.logger import log
from logging import DEBUG
import sys
import numpy as np
from typing import  Callable, Dict, List, Optional, Tuple, Union
from andante.program import AndanteProgram 
from andante.solver import AndanteSolver
from andante.parser import Parser
from andante.collections import OrderedSet
import federatedlearning.helper as helper
import numpy as np 

ilp = AndanteProgram.build_from("full_data.pl")
ilp.induce(update_knowledge=True, logging=True, verbose=1)

print (ilp.results)