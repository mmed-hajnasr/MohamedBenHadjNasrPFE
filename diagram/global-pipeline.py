from diagrams import Diagram, Edge, Cluster
from diagrams.custom import Custom

from diagrams.azure.devops import Pipelines, Boards, Repos, Artifacts
from diagrams.azure.web import AppServices
from diagrams.azure.database import SQLDatabases
from diagrams.onprem.vcs import Github

with Diagram("the complete workflow for the pipeline", show=False):
    developer = Custom("developer", "./my_recources/dev.png")
    dev_branch = Github("dev branch")
    pre_prod_branch = Custom("pre-prod branch", "./my_recources/branch.png")
    prod_branch = Custom("prod branch", "./my_recources/branch.png")
    terraform_pipeline = Pipelines("terraform Pipeline")
    terraform = Custom("terraform", "./my_recources/terraform.png")
    board = Boards("Azure Boards")
    repo = Repos("Azure Repos contains the terraform code")
    build_pipeline = Pipelines("build Pipeline")
    artifact = Artifacts("the application artifact")
    dev_release_pipeline = Pipelines("dev release Pipeline")
    pre_prod_pipeline = Pipelines("pre-prod release Pipeline")
    prod_pipeline = Pipelines("production release Pipeline")
    with Cluster ("the dev infrastructure"):
        dev_web = AppServices("the dev app") 
        dev_web >> SQLDatabases("the dev database")
    with Cluster ("the pre-prod infrastructure"):
        pre_prod_web = AppServices("the pre-prod app") 
        pre_prod_web >> SQLDatabases("the pre-prod database")
    with Cluster ("the production infrastructure"):
        blue_slot = AppServices("blue slot")
        green_slot = AppServices("green slot")
        production_database = SQLDatabases("the production database")
        blue_slot >> production_database
        green_slot >> production_database

    board >> developer >> Edge(label="push to github") >> dev_branch >> build_pipeline >> artifact >> dev_release_pipeline
    build_pipeline >> Edge(label="trigger the terraform pipeline",color="blue") >> terraform_pipeline
    terraform >> repo >> terraform_pipeline >> Edge(label="create the dev infrastructure") >> dev_web
    terraform_pipeline >> Edge(label="trigger the dev release pipeline",color="blue") >> dev_release_pipeline
    dev_release_pipeline >> Edge(label="deploy to the dev environment") >> dev_web
    dev_branch >> Edge(label="merge to pre-prod branch") >> pre_prod_branch >> Edge(label="trigger the pre-prod release pipeline",color="blue") >> pre_prod_pipeline
    artifact >> pre_prod_pipeline
    pre_prod_branch >> Edge(label="merge to prod branch") >> prod_branch >> Edge(label="trigger the production release pipeline",color="blue") >> prod_pipeline
    artifact >> prod_pipeline
    pre_prod_pipeline >> Edge(label="deploy to the pre-prod environment") >> pre_prod_web
    prod_pipeline >> Edge(label="deploy to the blue slot environment") >> blue_slot
    prod_pipeline >> Edge(label="switch the two slots") >> green_slot