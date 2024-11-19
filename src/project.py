#import needed packages
import pandas as pd
import numpy as np
import json

dataset_folder = "../InSecTT_BLE_Channel_Sniff_Dataset/dataset_ubertooth/set_1"

# Load the metadata of the dataset
with open(f"{dataset_folder}/metadata.json", 'r') as fp:
    metadata = json.load(fp)
 
# load all dataframes in list
data = []

for AA in metadata["AA"]:
    df = pd.read_csv(f"{dataset_folder}/{AA}.csv") 
    data.append(df)


# do whatever now
