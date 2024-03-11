# diagram.py
from diagrams import Diagram, Cluster
from diagrams.azure.web import AppServices 
from diagrams.azure.database import SQLDatabases
from diagrams.azure.storage import StorageAccounts
from diagrams.azure.network import DNSPrivateZones, Subnets ,PrivateEndpoint


with Diagram("Web app with private access to database and stroage account", show=False):
    with Cluster("the virtual network"):
        with Cluster("vnet integration subnet"):
            web = AppServices("main app")

        with Cluster("endpoints subnet"):
            with Cluster("Database Module"):
                database_module = DNSPrivateZones("database dns zone")
                database_module >> PrivateEndpoint("database endpoint") >> SQLDatabases("the managed database")
            with Cluster("Storage Module"):
                storage_module = DNSPrivateZones("storage dns zone")
                storage_module >> PrivateEndpoint("stoarage endpoint") >> StorageAccounts("the storage account")

    web >> [database_module, storage_module]