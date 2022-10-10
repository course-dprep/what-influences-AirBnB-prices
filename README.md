# How do Property Characteristics influence AirBnB prices and does booking early guarantee a Lower Price?

## 1.Purpose and Motivation
Airbnb offers many tourists and travelers a relatively affordable and convenient accomodation option and home owners an extra source of income. This project aims to estimate the effects of (a) listing characteristics, (b) time untill the booking starts and (c) season on the price per night of the listing. The findings of this reasearch will aid Airbnb hosts in the developing a suitable pricing strategy based on the characteristics of the properties they own. Moreover, in this project we investigate all Hawaiian AirBnB listings. The data in this projects is sourced from [Inside AirBnB](http://insideairbnb.com/).

## 2.Research Question
_What are the effect of the property characteristics and the number of days left untill the booking starts on the price per night of Hawaiian AirBnB listings and do prices differ per season?_

### Conceptual Model


## 3.Method
### 3.1. Included Variables

Overview of the variables incuded in this study:
|Variable (group) |Description|
|---------|----------|
|**room_type**|Since there are 4 room types: "Entire home/apt", "Private room", "Shared room", "Hotel", three dummy variables have been coded (a hotel room being the baseline) for the purpose of including them in the regression analysis. **Entire_home_apt_room_type** (1 if listing is an entire home or apartment, 0 if the listing is of a different type); **Private_room_room_type** (1 if listing is a private room, 0 if the listing is of a different type). **Shared_room_room_type** (1 if listing is a shared room, 0 if the listing is of a different type)|
|**neighbourhood_goup**|Since in Hawaii there are 4 neighbourhood groups: "Hawaii", "Kauai", "Maui", "Honolulu", three dummy variables have been coded (Honolulu being the baseline) for the purpose of including them in the regression analysis. **Hawaii_neignborhood** (1 if listing is in the Hawaii neighbourhood, 0 if the listing is in a different neighbourhood. **Kauai_neignborhood** (1 if listing is in the Kauai neighbourhood, 0 if the listing is in a different neighbourhood. **Maui_neignborhood** (1 if listing is in the Maui neighbourhood, 0 if the listing is in a different neighbourhood.|
|**accommodates**|the maximum number of guest the propery can accommodate|
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
We use regression analysis to examine the effects of the propery characteristics and time until booking starts on the listing price. We are interested in which property characteristics drive the price up or down and which have the largest effects. The dependent variable is the listing price of the Hawaiian Airbnb listing. The independent variables are given in the table above. The general regression equation can be summarized as follows:

_Y = β0 + β1*entire_home_apt_room_type + β2*private_room_room_type + β3*shared_room_room_type + β4*hawaii_neignborhood + β5*kauai_neignborhoodbathroom_type + β6*maui_neignborhood + β7*accommodates + β8*bathrooms + β9*bathroom_type + β10*bedrooms + β11*beds + β12*review_score_rating + β13*instant_bookable + β14*time_diff + β15*winter + ε_

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
Please follow the [installation guide](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/) to install R.

Also, make sure you have installed below packages:
```
install.packages("tidyverse")
install.packages("utils")
install.packages("stringr")
```

## 6.Running Instructions

## 7.Results and Conclusion
### 7.1.Results

### 7.2 Conclusion

## Team 10 Data Preparation & Workflow Management
- Alexandra Bock [a.bock@tilburguniversity.edu]
- Koray Kul [a.b.luca@tilburguniversity.edu]
- Ana Luca [k.kul@tilburguniversity.edu]
- Merel van Stekelenburg [m.vanstekelenburg@tilburguniversity.edu]
