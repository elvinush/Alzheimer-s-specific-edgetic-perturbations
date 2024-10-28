There have been four main coding steps in the thesis: Creation of the global PPIN, Preprocessing, Preparation for Cytoscape and Analysis.

For the creation and pruning of the global PPIN globalPPIN_Kuester.ipynb was used.

Preprocessing consisted of first running Prep_proteiNORM.ipynb to fit the MS datasets into the format required by ProteiNORM.
After that, normalize_vsn.R and normalize_cyclic.R normalized each dataset with the respective method.
Before imputation, for each dataset, diseased and healthy groups are seperated using seperate_groups.ipynb.
Lastly, Random_Forest_Impute.py takes each dataset and imputes missing values.

For Cytoscape preparation I just needed avg_patient_official.ipynb to average out all abundance data for each group.

In step 3 (Analysis) there is the script naming_efficiency.ipynb which measures how efficient the mapping of MS data onto the global PPIN was.
Next, score_pert_edges2.ipynb scores all edges from all networks and score_pert_nodes.ipynb scores all nodes that were present in the rewired networks.
