import flwr as fl;
import sys; 
import numpy as np;
from flwr.server.strategy.fedilp import FedILP


# Create strategy and run server
strategy = FedILP()

# Start Flower server for three rounds of federated learning
fl.server.start_server(
        server_address = "0.0.0.0:8080" , 
        config=fl.server.ServerConfig(num_rounds=2),
        strategy = strategy,
)

