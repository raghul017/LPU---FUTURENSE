# 1-Filtering data

import pandas as pd

df = pd.DataFrame(
    {
        "City": ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"],
        "Population": [8623000, 3990456, 2705994, 2320268, 1680992],
    }
)

# Filter cities with a population greater than 3 million
filtered_df = df[df["Population"] > 3000000]

# Display the filtered dataframe
print("Cities with population greater than 3 million:")
print(filtered_df)

# 2. Grouping and Aggregating Data


df = pd.DataFrame(
    {
        "Month": ["Jan", "Feb", "Jan", "Feb", "Mar"],
        "Sales": [10000, 15000, 12000, 18000, 20000],
    }
)

# Group by 'Month' and calculate the total sales for each month
monthly_sales = df.groupby("Month")["Sales"].sum().reset_index()

# Display the grouped dataframe
print("Monthly sales data:")
print(monthly_sales)

# 3. Data Cleaning: Handling Missing Values

import numpy as np

df = pd.DataFrame(
    {
        "Name": ["Alice", "Bob", "Charlie", "David"],
        "Age": [25, np.nan, 30, np.nan],
        "Salary": [50000, 60000, np.nan, 70000],
    }
)

# Replace missing values in 'Age' with the mean age
mean_age = df["Age"].mean()
df["Age"].fillna(mean_age, inplace=True)

# Drop rows with missing values in any column
clean_df = df.dropna()

# Display the cleaned dataframe
print("Cleaned employee data:")
print(clean_df)


# 4. Merging DataFrames

import pandas as pd

df1 = pd.DataFrame(
    {"EmployeeID": [1, 2, 3, 4], "Name": ["Alice", "Bob", "Charlie", "David"]}
)

df2 = pd.DataFrame(
    {"EmployeeID": [3, 4, 5, 6], "Department": ["HR", "IT", "Marketing", "Finance"]}
)

# Merge dataframes on 'EmployeeID'
merged_df = pd.merge(df1, df2, on="EmployeeID", how="inner")

# Display the merged dataframe
print("Merged Employee Data:")
print(merged_df)

# 5.Data Transformation: Adding a New Column

import pandas as pd

df = pd.DataFrame(
    {"Product": ["A", "B", "C", "A", "B"], "Units Sold": [100, 150, 200, 120, 180]}
)

# Calculate total revenue (assuming price per unit is $10)
df["Revenue"] = df["Units Sold"] * 10

# Display the dataframe with the new 'Revenue' column
print("Sales Data with Revenue Calculation:")
print(df)
