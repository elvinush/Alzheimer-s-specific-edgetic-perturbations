#This script was used to impute missing values in all datasets using the HPC

import numpy as np
import pandas as pd
import math as m
from os import *
from sklearn.experimental import enable_iterative_imputer
from sklearn.impute import IterativeImputer
from sklearn.ensemble import RandomForestRegressor


#Read and transform data if necessary to fit the correct format for imputation

df = pd.read_csv(r"/home/students/e.kalinowski/banner_proteomics_TMT_v2_norm.csv")

df = df.T
df.columns = df.iloc[0]
df = df.drop(['Unnamed: 0'])
df = df.reset_index()
df = df.rename(columns={'index': 'batch.channel'})
df.columns.name = None


#Impute the datasets. This was done by dividing each dataset into subsets of 500 columns (proteins) in order to decrease runtime.

imp = IterativeImputer(estimator = RandomForestRegressor(), max_iter=30, random_state = 0)

final_frame = df.iloc[:, :1]
X = df.drop('batch.channel', axis = 1)
X = X.astype(np.float32)
subset_size = 500

for subset_nr in range(1, (m.ceil(len(list(X))/subset_size))+1):
    X_copy = X.iloc[:, (subset_nr-1)*subset_size:subset_nr*subset_size]
    X_trans = imp.fit_transform(X_copy)
    X_trans = pd.DataFrame(X_trans, columns = list(X_copy))
    final_frame = pd.concat([final_frame, X_trans], axis=1)


#Save the imputed dataset

final_frame.to_csv("banner_proteomics_TMT_v2_imp.csv")