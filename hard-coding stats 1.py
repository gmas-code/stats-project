# -*- coding: utf-8 -*-
"""
Created on Wed Sep  9 19:53:19 2020

@author: gusta
"""
import os
import numpy as np
import pandas as pd
from sklearn.preprocessing import scale
import seaborn as sns

os.chdir('C:/Users/gusta/Desktop/Python Notebooks')
iris = pd.read_csv('iris.csv.csv')
iris.head()

# Basic Lenght and Sum functions

def my_len(variable):
    n = 0
    for x in variable:
        n += 1
    return(n)
        

def my_sum(variable):
    n = 0
    for x in variable:
        n += x
    return(n)
        
def my_mean(variable):
   return(my_sum(variable)/my_len(variable))

# Testing

sum(iris['sepal_length'])
my_sum(iris['sepal_length'])
        
np.mean(iris['sepal_length'])
my_mean(iris['sepal_length'])


#sum of squared differences

def my_ssd(variable,loc):
    x= sum((variable-loc)**2)
    return(x)

my_ssd(iris['sepal_length'],my_mean(iris['sepal_length']))

# variance

def my_var(variable):
    x = sum((variable-my_mean(variable))**2)/my_len(variable)
    return(x)

my_var(iris['sepal_length'])

np.var(iris['sepal_length'])


# normalization

scale(iris['sepal_length'])

sns.histplot(scale(iris['sepal_length']),bins=20,color='green')

# This one does not work yet
# Note the need to use numpy for the square root
def my_scaler(array):
    loc = my_mean(array)
    sd = np.sqrt(my_var(array))
    for e in array:
        y = e-loc/sd
        return(y)


my_scaler(iris['sepal_length'])
