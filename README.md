# How do Property Characteristics influence AirBnB prices and does booking early guarantee a Lower Price?

## 1.Purpose and Motivation
AirBnB offers many tourists and travelers a relatively affordable and convenient accommodation option and home owners an extra source of income. This project aims to estimate the effects of the property characteristics, the time left until the booking starts and the season on the price per night of Hawaiian AirBnB listing by using the publicly available data from [Inside AirBnB](http://insideairbnb.com/).

Our findings are not only relevant for tourists by giving them insights into how prices fluctuate across time or which neighborhood is the cheapest, and thus help them save money on their trip, but also AirBnB hosts by helping them develop a suitable pricing strategy based on the characteristics of the properties they own.

## 2.Research Question
_What are the effects of the property characteristics and the number of days left until the booking starts on the price per night of Hawaiian AirBnB listings and do prices differ per season?_

### Conceptual Model
<img width="1145" alt="Screenshot 2022-10-13 at 12 05 26" src="https://user-images.githubusercontent.com/96148213/195839831-323b17ac-e50d-48f8-94d4-7ec0af44222c.png">

_Figure 1. Conceptual Model_

## 3.Method
### 3.1. Included Variables

Overview of the variables included in this study:
|Variable (group) |Description|
|---------|----------|
|**room_type**|Since there are 4 room types: "Entire home/apt", "Private room", "Shared room", "Hotel", three dummy variables have been coded (a hotel room being the baseline) for the purpose of including them in the regression analysis. **Entire_home_apt_room_type** (1 if listing is an entire home or apartment, 0 if the listing is of a different type); **Private_room_room_type** (1 if listing is a private room, 0 if the listing is of a different type). **Shared_room_room_type** (1 if listing is a shared room, 0 if the listing is of a different type)|
|**neighbourhood_goup**|Since in Hawaii there are 4 neighborhood groups: "Hawaii", "Kauai", "Maui", "Honolulu", three dummy variables have been coded (Honolulu being the baseline) for the purpose of including them in the regression analysis. **Hawaii_neighborhood** (1 if the listing is in the Hawaii neighbourhood, 0 if the listing is in a different neighbourhood. **Kauai_neighborhood** (1 if the listing is in the Kauai neighbourhood, 0 if the listing is in a different neighbourhood. **Maui_neighborhood** (1 if the listing is in the Maui neighborhood, 0 if the listing is in a different neighborhood.|
|**accommodates**|the maximum number of guest the property can accommodate|
|**bathrooms**|the number of bathrooms of the property|
|**bathroom_type**|dummy variable to indicate whether the bathroom(s) are private or shared|
|**bedrooms**|the number of bedrooms of the property|
|**beds**|the number of beds of the property|
|**review_score_rating**|the review score rating of the property (on a 5-point scale)|
|**instant_bookable**|dummy indicating whether the property can be booked automatically or the host's approval is needed|
|**time_diff**|the number of days left until the booking starts|
|**winter**|dummy variable indicating the season (Hawaii only has two seasons) taking the value 1 for **winter** (November-April) and 0 for **summer** (May-October)|

Overview of other variables used to merge different datasets or aggregate the data:
|Variable |Used for:|
|---------|----------|
|**id**|merging the listings and the calendar datasets|
|**date**|aggregating the dataset per season|

Data dictionary of the raw datasets can be found [here](https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit#gid=1322284596).

### 3.2.Research Method
In order to estimate the effect of several metric and non-metric variables (property characteristics, time until booking starts and season) on another metric variable (listing price of the Hawaiian Airbnb listing), we opt for a regression analysis. We are interested in which property characteristics drive the price up or down and which have the largest effects. All independent variables are outlined in the table above. The regression equation can be summarized as follows:

_Y = β0 + β1 * entire_home_apt_room_type + β2 * private_room_room_type + β3 * shared_room_room_type + β4 * hawaii_neignborhood + β5 * kauai_neignborhoodbathroom_type + β6 * maui_neignborhood + β7 * accommodates + β8 * bathrooms + β9 * bathroom_type + β10 * bedrooms + β11 * beds + β12 * review_score_rating + β13 * instant_bookable + β14 * time_diff + β15 * winter + ε_

## 4.Repository overview 
```
├── README.md
├── data
├── gen
│   ├── analysis
│   ├── data-preparation
│   └── paper
└── src
|  ├── analysis
|  ├── data-preparation
|  └── paper
└── make file
```

## 5.Dependencies
Please follow this [guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/) to install R.

Also, make sure you install the following packages:
```
install.packages("tidyverse")
install.packages("utils")
install.packages("stringr")
```

## 6.Running Instructions

### Cloning Repository
1. Open Git Bash
2. Change working directory to preferred location
3. Type ```git clone https://github.com/course-dprep/what-influences-AirBnB-prices.git```

### Running makefile
1. Change working directory to what-influences-AirBnB-prices
2. Type ```make```

## 7.Results, Vizualizations and Conclusion

### 7.1.Results
The regression output can be found below.

![daac9914-1e2e-4a17-a6c6-6a5846d31520](https://user-images.githubusercontent.com/96148213/194941090-b4351b1f-20ef-41ed-b619-fa8ebec52467.JPG)

_Figure 2. Regression Output_

## 7.2.Interpretation
- An entire room or apartment listed on AirBnB is on average €65.51 cheaper compared to a hotel room;
- A private room listed on AirBnB is on average €23.40 cheaper than a hotel room;
- A shared room listed on AirBnB is on average €151.4 cheaper than a hotel room;
- AiBnB listings in the Hawaii neighborhood are on average €29.47 cheaper than listings in the Honolulu neighborhood;
- AiBnB listings in the Kauai neighborhood are on average €75.63 more expensive than listings in the Honolulu neighborhood;
- AiBnB listings in the Maui neighborhood are on average €85.41 more expensive than listings in the Honolulu neighborhood;
- A property that can accommodate an additional guest will have an average price higher by €30.37;
- A property that has an additional bathroom will have an average price higher by €77.84;
- A listing with a shared bathroom will cost on average €113.2 less than listings that have a private bathroom;
- A property that has an additional bedroom will have an average price higher by €9.61;
- A property that has an additional bed will have an average price higher by €1.54;
- On average, AirBnB listings in Hawaii that have a review score higher by 1 unit will charge €22.92 more;
- A listing that can be booked instantly (i.e., doesn't require the host's approval) costs on average €21.24 more than listings for which the host's approval is required;
- When the time difference in days between the date of booking an accommodation and the start date the reservation increases by 1 day, the price will decrease by €0.36;
- On average, AirBnB listings in Hawaii are on average €13.19 more expensive during winter (November-April) than during summer (May-September).

### 7.3. Selected Vizualizations
  ### Does Booking Early Guarantee a Lower Price?
<img width="647" alt="Screenshot 2022-10-14 at 13 46 26" src="https://user-images.githubusercontent.com/96148213/195842420-31d24644-9657-479c-83fa-ffe74d0e8127.png">

Travelers looking to save money seem to be best off if they book their AirBnB approximately 90-100 days in advance (~ three months), with an average price for an entire home/apartment of around $310 and an average price for a private room of around $270. Interestingly, prices seem to spike around 200 days prior to the booking start date, with the average entire home or apartment reaching $355, making it very disadvantageous for travelers to book around six months in advance. Rather, it would be better to book a bit later.

  ### Which Neighborhood should you Choose?
<img width="638" alt="Screenshot 2022-10-14 at 13 46 37" src="https://user-images.githubusercontent.com/96148213/195842382-31283af0-1a65-4c8f-89dd-7af3253f83d9.png">

Regardless of the room type travelers are looking for, Hawaii and Honolulu seem to be the cheapest neighborhoods and Muai is the most expensive one. Interestingly, a private room in Maui is more expensive than an entire home or apartment.

### 7.4. Conclusion
Our findings are relevant for both tourists and travelers  as well as AirBnB hosts. 

For hosts: 
- Consumers are willing to pay a premium of €22.92 for properties that have a review score higher by 1 unit;
- You can charge higher prices by €13.19 during winter season as opposed to summer;
- The Hawaii neighborhood has the cheapest listings, while the Maui neighborhood is the most expensive;
- Prices in general increase over time;
- You can charge higher prices by €21.24 by listing your property as instantly bookable;

For consumers:
- Book early! Prices on average increase by €0.36 per day.
- The Hawaii neighborhood has the cheapest AirBnB listings.
- If you're flexible, visit Hawaii during summer! AirBnB listings in Hawaii are on average €13.19 more expensive during winter (November-April) than during summer (May-September).


## Team 10 Data Preparation & Workflow Management
- Alexandra Bock [a.bock@tilburguniversity.edu]
- Koray Kul [k.kul@tilburguniversity.edu] 
- Ana Luca [a.b.luca@tilburguniversity.edu]
- Merel van Stekelenburg [m.vanstekelenburg@tilburguniversity.edu]
