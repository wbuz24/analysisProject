import pandas as pd
import matplotlib.pyplot as plt

# Load your data (example assuming a CSV file format)
df = pd.read_csv("../InSecTT_BLE_Channel_Sniff_Dataset/dataset_hackrf/set_1/2de79d63.csv")

# Plot packet size over time (example)
plt.figure(figsize=(10,6))
print(df)
plt.plot(df['t_a'], df['Length'])
plt.xlabel('Time')
plt.ylabel('Packet Size (bytes)')
plt.title('Packet Size over Time')
plt.show()
