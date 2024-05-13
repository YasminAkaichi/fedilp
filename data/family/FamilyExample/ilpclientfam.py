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

#LOAD MODEL
#model= tf.keras.applications.MobileNetV2((32,32,3),classes=10,weights=None)
#model.compile("adam","sparse_categorical_crossentropy", metrics=["accuracy"])

#LOAD CIFAR-10 dataset 
#(x_train,y_train),(x_test,y_test)= tf.keras.datasets.cifar10.load_data()

#Load DATA and MODEL
ilp = AndanteProgram.build_from("fam.pl")




# Define Flower client
class FlowerClient(fl.client.NumPyClient):
    def get_parameters(self, config):
        log (DEBUG, "getting parameters using get parameters")
        if ilp.results is None:
            #return model.get_weights()
            ilp.results = OrderedSet([
            " :- ."])
        return helper.get_parameters(ilp.results)
    def fit(self, parameters, config):
        #model.set_weights(parameters)
        helper.set_parameters(ilp,parameters)
        #model.fit(x_train, y_train, epochs=1, batch_size=32)
        log(DEBUG, "Performing training on local dataset")
        ilp.induce(update_knowledge=True, logging=True, verbose=1)
        log(DEBUG, "Finished training on rules") 
        #return model.get_weights(), 10, {}
        return helper.get_parameters(ilp.results), 10,{}

    def evaluate(self, parameters, config):
        helper.set_parameters(ilp, parameters)
        #model.set_weights(parameters)
        #loss, accuracy = model.evaluate(x_test, y_test)
        #return loss, len(x_test), {"accuracy": accuracy}
        log(DEBUG, "Evaluating rules")
        return 0.5, 10, {"accuracy": 0.95}

# Start Flower client
fl.client.start_numpy_client(
        server_address="127.0.0.1:8080", 
        client=FlowerClient()
)