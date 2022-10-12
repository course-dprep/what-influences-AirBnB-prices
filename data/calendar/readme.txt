==========================================================
          D A T A S E T   D E S C R I P T I O N
==========================================================

Name of the dataset: calendar_j, calendar_j_s

----------------------------------------------------------

1. Motivation of data collection (why was the data collected?)

The data was collected to obtain the dates of the listings, along with the prices. From the initially downloaded dataset calendar_j, only the necessary columns are kept. This smaller dataset is named calendar_j_s.

2. Composition of dataset (what's in the data?)

The dataset contains the following columns: **listing_id**, **date**, **price**

3. Collection process (how was the data collected?)

Data is downloaded from the Inside AirBNB website. See src/data-preparation/download_june.R. 

4. Preprocessing/cleaning/labeling (how was the data cleaned, if at all?)

Before creating the dataset calendar_j_s, columns **price** and **adjusted_price** were compared. From these columns, the $ sign was removed and the type has been changed to double. Since there was no difference between them, only **price** column was kept. The **date** column has been transformed into a Date object. A new column **time_diff** is added, containing the difference in days between the **date** column and the initial starting date of the datasets, 2022-06-08. 

5. Uses (how is the dataset intended to be used?)

 Dataset calendar_j_s is merged with the listings dataset to connect each listing with its date, price and time difference until booking.

6. Distribution (how will the dataset be made available to others?)

Dataset is saved as output from the src/data-preparation/preparation_calendar.R 

7. Maintenance (will the dataset be maintained? how? by whom?)

None. 

