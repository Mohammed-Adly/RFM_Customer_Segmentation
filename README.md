# Customer Segmentation using RFM Analysis (RFM)

This project analyzes customer transaction data to segment customers into distinct groups based on their purchasing behavior. The primary goal is to identify different customer archetypes to enable targeted marketing strategies. The analysis uses value-based segmentation and the RFM (Recency, Frequency, Monetary) model.

### 1. Data Loading and Initial Inspection

- **Database Connection**: A connection to the `CustomerDB` SQL Server database was established using `sqlalchemy` and `pyodbc`.
- **Data Retrieval**: The `Customers` table was loaded into a pandas DataFrame.
- **Initial Assessment**: An initial review was conducted using `df.info()` to check data types and null values, and `df.describe()` to get statistical summaries of the numerical columns.

### 2. Data Cleaning

To ensure data quality, the following preprocessing steps were performed:

-  **Handling Missing Values**: Rows with missing `CustomerID` values were removed[cite: 88], as they are essential for this analysis.  A total of 3,724 rows with null CustomerIDs were identified[cite: 70].
-  **Removing Duplicates**: Any duplicate rows in the dataset were dropped to avoid data redundancy[cite: 85].
- **Correcting Data Types**: Column data types were adjusted for accurate analysis:
  -  `Amount` was converted from object to float[cite: 91].
  -  `CustomerID` was converted from float to integer[cite: 92].
  -  `InvoiceDate` was converted to datetime objects[cite: 93].
-  **Removing Cancellations**: Transactions with a negative or zero `Quantity` were filtered out to exclude canceled orders and returns from the analysis[cite: 95].

### 3. Exploratory Data Analysis (EDA) & Outlier Detection

-  Box plots were generated for the `Quantity` and `Amount` columns to visually identify outliers in the data[cite: 103, 109]. These plots helped in understanding the distribution of transaction values and quantities.

![Box Plot for Quantity](./images/boxplot_quantity.png)
![Box Plot for Amount](./images/boxplot_amount.png)

### 4. Value-Based Customer Segmentation

An initial, simple segmentation was performed to distinguish between high-value and standard transactions.

-  **IQR Method**: The Interquartile Range (IQR) was calculated for the `Amount` column[cite: 138, 139, 140].
-  **VIP vs. Normal Customers**: An upper bound was defined as $Q3 + 1.5 * IQR$[cite: 141].  Transactions with an `Amount` exceeding this threshold (`941.38`) were classified as 'VIP' [cite: 143, 162] , while the rest were 'Normal'[cite: 144].
-  **Visualization**: A pie chart was created to show the proportion of VIP (7.9%) versus Normal (92.1%) invoices[cite: 177, 181, 182].


![Proportion of Normal vs. VIP Invoices](./images/pie_chart_vip.png)


### 5. RFM (Recency, Frequency, Monetary) Analysis

To achieve a more nuanced segmentation, the RFM model was applied:

-  **Calculate RFM Values**: For each `CustomerID`, the following metrics were computed[cite: 187]:
  -  **Recency**: Days since the customer's last purchase[cite: 192, 195].
  -  **Frequency**: Total number of unique invoices[cite: 193, 195].
  -  **Monetary**: Total amount spent[cite: 194, 196].
-  **Assign RFM Scores**: Customers were scored from 1 to 4 for each RFM metric based on quartiles[cite: 203, 205].  A combined `RFM_Score` was created by concatenating these scores[cite: 207].

### 6. Customer Segmentation & Visualization

-  **Segment Definition**: Customers were categorized into actionable segments like 'Champions', 'At-Risk Customers', 'Potential Loyalists', and 'Hibernating Customers' using a predefined mapping based on their RFM scores[cite: 209, 223].
-  **Final Visualization**: A horizontal bar chart was generated to display the total number of customers within each defined segment[cite: 228], providing a clear view of the customer base distribution.

![Number of Customers in Each Segment](./images/bar_chart_segments.png)

## Technologies Used

- **Python**
-  **Pandas**: For data manipulation and analysis[cite: 4].
-  **SQLAlchemy**: For database connection[cite: 5].
-  **Matplotlib & Seaborn**: For data visualization[cite: 100, 99].
