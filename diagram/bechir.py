from graphviz import Digraph

dot = Digraph(comment='CI/CD Pipeline BPMN')

dot.node('Start', 'Start', shape='ellipse')
dot.node('Commit', 'Code Commit', shape='rectangle')
dot.node('Build', 'Build', shape='rectangle')
dot.node('BuildSuccess', 'Build Success?', shape='diamond')
dot.node('Test', 'Test', shape='rectangle')
dot.node('TestSuccess', 'Test Success?', shape='diamond')
dot.node('StagingDeploy', 'Deploy to Staging', shape='rectangle')
dot.node('StagingTest', 'Staging Tests', shape='rectangle')
dot.node('StagingTestSuccess', 'Staging Test Success?', shape='diamond')
dot.node('ProductionDeploy', 'Deploy to Production', shape='rectangle')
dot.node('End', 'End', shape='ellipse')

dot.edge('Start', 'Commit')
dot.edge('Commit', 'Build')
dot.edge('Build', 'BuildSuccess')
dot.edge('BuildSuccess', 'End', label='No')
dot.edge('BuildSuccess', 'Test', label='Yes')
dot.edge('Test', 'TestSuccess')
dot.edge('TestSuccess', 'End', label='No')
dot.edge('TestSuccess', 'StagingDeploy', label='Yes')
dot.edge('StagingDeploy', 'StagingTest')
dot.edge('StagingTest', 'StagingTestSuccess')
dot.edge('StagingTestSuccess', 'End', label='No')
dot.edge('StagingTestSuccess', 'ProductionDeploy', label='Yes')
dot.edge('ProductionDeploy', 'End')

file_path = 'ci_cd_pipeline_bpmn.png'
dot.render(file_path, format='png', cleanup=True)

file_path