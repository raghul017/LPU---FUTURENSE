# 1 -Statistical Analysis and Visualization

import matplotlib.pyplot as plt
import pandas as pd

df = pd.DataFrame(
    {"Category": ["A", "B", "A", "B", "A", "B"], "Value": [1, 2, 3, 4, 5, 6]}
)

# Box plot grouped by 'Category'
df.boxplot(column="Value", by="Category")
plt.title("Distribution of Values by Category")
plt.ylabel("Value")
plt.xlabel("Category")
plt.show()


# 2 - Time Series Visualization

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

dates = pd.date_range("2023-01-01", periods=100)
values = np.random.randn(100).cumsum()


errors = np.random.rand(100) * 2

# Create DataFrame
df = pd.DataFrame({"Date": dates, "Value": values, "Error": errors})

# Plot time series with error bars
plt.errorbar(
    df["Date"], df["Value"], yerr=df["Error"], fmt="-o", ecolor="red", capsize=5
)
plt.xlabel("Date")
plt.ylabel("Value")
plt.title("Time Series with Error Bars")
plt.show()

# 3 - Customizing Matplotlib Plots

import matplotlib.pyplot as plt
import pandas as pd

df = pd.DataFrame(
    {
        "X": [1, 2, 3, 4, 5],
        "Y": [5, 4, 3, 2, 1],
        "Color": ["red", "blue", "green", "yellow", "orange"],
        "Size": [10, 20, 30, 40, 50],
    }
)

# Scatter plot with custom color and size
plt.scatter(df["X"], df["Y"], c=df["Color"], s=df["Size"])
plt.colorbar()
plt.show()
