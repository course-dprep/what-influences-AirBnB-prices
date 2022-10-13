==========================================================
          D A T A S E T   D E S C R I P T I O N
==========================================================

Name of the dataset: june_s

----------------------------------------------------------

1. Motivation of data collection (why was the data collected?)

The data was collected to obtain information on all Hawaiian properties that were listed on AirBnB on 08-06-2022 (the date the data was scraped from AirBnB). As we are only interested in a subset of all the property characteristics available in the raw dataset named june, we only kept the necessary columns in a smaller dataset called june_s. 

2. Composition of dataset (what's in the data?)

The june_s dataset initially (prior to data cleaning and preparation) contained the following columns: **id**, **bathrooms**, **bathrooms_text**, **price**, **neighbourhood_group_cleaned**, **room_type**, **accommodates**, **bedrooms**, **beds**, **instant_bookable, **review_scores_rating**.

3. Collection process (how was the data collected?)

Data is downloaded from the Inside AirBnB website. See src/data-preparation/download_june.R. 

4. Preprocessing/cleaning/labeling (how was the data cleaned, if at all?)

Several data preparation techniques have been used to prepare the raw data for our specific purpose (i.e., computing new variables, changing variable types, imputing missing values, creating dummy variables, etc.). All of the steps we took are outlined below.

The variable bathrooms_text was used to compute the number of bathrooms (**bathrooms**) and create a dummy variable that indicates the type of bathroom (shared = 1, private = 0) (**bathroom_shared**). There are 22 NAs, which will be omitted in the regression analysis given that no sound assumption can be made to impute these missing values in an informed way. First, in order to compute the number of bathrooms, we first had to transform the bathrooms_text column into a workable column. To get the number of bathrooms, we used the function word(june_s$bathrooms_text,1) to only store the information before the first space character and then changed the type to double. Finally, for creating the type of bathroom dummy, we used the str_detect function to search for either 'shared' or 'Shared' in the bathrooms_text variable. To illustrate, for a listing for which had "1 private bathroom" for the bathroom_text variable, the variable bathrooms indicates 1 and the bathroom_shared takes the value 0.

However, there were still a few observations that needed additional omitted. Namely, a few listings state a "half bathroom" so we used the str_detect function again and assigned the value 0.5 to these listings for the bathrooms variable.

The variable **room_type** takes one of the following 4 values: "Entire home/apt", "Private room", "Shared room" or "Hotel". There were no missing or incorrect values. Using this variable, three dummy variables have been coded (a hotel room being the baseline) for the purpose of including them in the regression analysis: **entire_home_apt_room_type** (1 if the listing is an entire home or apartment, 0 if the listing is of a different type); **private_room_room_type** (1 if the listing is a private room, 0 if the listing is of a different type). **shared_room_room_type** (1 if listing is a shared room, 0 if the listing is of a different type).

The variable **neighbourhood_group_cleansed** takes one of the following 4 values: "Hawaii", "Kauai", "Maui", "Honolulu". There were no missing or incorrect values. Three dummy variables have been coded (Honolulu being the baseline) for the purpose of including them in the regression analysis: **hawaii_neighborhood** (1 if the listing is in the Hawaii neighbourhood, 0 if the listing is in a different neighbourhood.; **kauai_neighborhood** (1 if the listing is in the Kauai neighbourhood, 0 if the listing is in a different neighbourhood; **maui_neighborhood** (1 if the listing is in the Maui neighborhood, 0 if the listing is in a different neighborhood.

The **accommodates** variable which indicates the maximum number of people the listing can accommodate, needed no preparation, given ts initial numeric format. However, upon checking for any missing value, we found one missing value. After checking the listing, we realized that it is a hotel and has the wrong number of accommodates stated. Hence, we removed the listing with the id "43309266".

Using the **instant_bookable** variable (character type, with values "t" or "f"), we computed a new dummy variable named **instant_bookable_dummy** which takes the value 1 for listings for which guests can book instantly (i.e., no approval from the host required) and 0 for the bookings for which booking instantly is not possible. There were no missing or incorrect values.

The variable **bedrooms**  (number of bedrooms) contained 3534 NAs and the variable **beds** (number of beds) contained 310 NAs. We used these two variables, as well as the room type, together to impute missing values and thus reduce the number of NAs. If the room type was a private or a shared room, we imputed the NAs with the value 1. Remaining NAs were replaced with the mean of bedrooms or beds per room type since we considered this to be the most valid assumption we could make.

The variable **review_score_rating** has 4670 NAs, which will be omitted in the regression analysis given that no sound assumption can be made to impute these missing values in an informed way.

5. Uses (how is the dataset intended to be used?)

Dataset june_s is merged with the calendar dataset to connect each listing with its price on a specific date in the period 08-06-2022 and 08-06-2023 and time difference until booking would start.

6. Distribution (how will the dataset be made available to others?)

Dataset is saved as output from the src/data-preparation/preparation_listings.R 

7. Maintenance (will the dataset be maintained? how? by whom?)

None. 
