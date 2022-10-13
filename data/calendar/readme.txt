==========================================================
          D A T A S E T   D E S C R I P T I O N
==========================================================

Name of the dataset: calendar_j_s

----------------------------------------------------------

1. Motivation of data collection (why was the data collected?)

The data was collected to obtain the listing price per night for each day in the period 2022-06-08 - 2023-06-08 for all Hawaiian properties that were listed on AirBnB on 08-06-2022 (the date the data was scraped from AirBnB). From the initially downloaded dataset calendar_j, only the necessary columns are kept. This smaller dataset is named calendar_j_s.

2. Composition of dataset (what's in the data?)

The calendat_j_s dataset initially (prior to data cleaning and preparation) contained the following columns:: **listing_id**, **date**, **price** and **price_adjusted**

3. Collection process (how was the data collected?)

Data is downloaded from the Inside AirBnB website. See src/data-preparation/download_june.R. 

4. Preprocessing/cleaning/labeling (how was the data cleaned, if at all?)

Before creating the dataset calendar_j_s, columns **price** and **adjusted_price** were compared. First, the $ sign was removed from these columns  and the type has been changed to double. Since there was no difference between them, only the **price** column was kept. 
Since we wanted to investigate the fluctuations in prices across time, we first had to transform the **date** column into a Date object. Then, a new column **time_diff** is added, containing the difference in days between the **date** column and the date when the data was scraped (2022-06-08), representing the time left in days until the booking would start. 

For the purpose of merging this dataset with the listings one, the **listing_id** column is renamed to **id**.

Finally, a new dummy variable **winter** was coded so we can investigate the effect of the season on the listing prices. Hawaii only has two seasons: summer between May and October and winter between November and April. We used the **date** variable to assign the correct value to this dummy variable. 

5. Uses (how is the dataset intended to be used?)

Dataset calendar_j_s is merged with the listings dataset to connect each listing with its price on a specific date in the period 08-06-2022 and 08-06-2023 and time difference until booking would start.

6. Distribution (how will the dataset be made available to others?)

Dataset is saved as output from the src/data-preparation/preparation_calendar.R 

7. Maintenance (will the dataset be maintained? how? by whom?)

None. 


