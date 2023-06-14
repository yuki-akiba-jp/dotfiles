import numpy as np
import pandas as pd
from pandas import DataFrame


def homework(n):
    url_winequality_data = 'https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv'

    df = pd.read_csv(url_winequality_data, sep=';')


    # Display the first few rows of the DataFrame
    # print(df.head())
    # print(df.columns)


    # Add new column to store the n groups
    volatile_acidity_group_key_name = 'volatile_acidity_group_key_name'
    df[volatile_acidity_group_key_name] = pd.qcut(df['volatile acidity'],q=n)
    # print(df.groupby(volatile_acidity_group_key_name).mean())

    # Filter DataFrame where 'quality' is 5

    filtered_df = df[df['quality'] == 5]
    alcohol_means = filtered_df.groupby(volatile_acidity_group_key_name)['alcohol'].mean()
    print(alcohol_means)
    min_alcohol = alcohol_means.min()
    print(min_alcohol)
    return min_alcohol



n = 5
homework(n)
