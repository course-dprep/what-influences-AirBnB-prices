# Which Property Characteristics Influence AirBnB Prices and Does Booking Early Always Guarantee a Lower Price?

## Purpose and Motivation
Airbnb offers many tourists and travelers a relatively affordable and convenient accomodation option and home owners an extra source of income. This project aims to estimate the effects of (a) listing characteristics  and (b) time untill the booking starts on the price of the listing. The findings of this reasearch will aid Airbnb hosts in the developing a suitable pricing strategy based on the characteristics of the properties they own. Moreover, in this project we investigate all Hawaiian AirBnB listings and look into the seasonal differences of the listing prices. The data in this projects is sourced from [Inside AirBnB](http://insideairbnb.com/).

## Research Question
_What are the effect of the property characteristics and teh number of days left untill the booking starts on the price per night of Hawaiian AirBnB listings and how do these effects differ per season?_

### Conceptual Model
<img width="1166" alt="Screenshot 2022-10-10 at 10 07 30" src="https://user-images.githubusercontent.com/96148213/194823008-aadf81e7-bbb5-4695-a345-cffaa20b0b0c.png">

## Method
### Included Variables

Overview of the variables incuded in this study:
|Variable |Decription|
|---------|----------|
|room_type|takes one of the following 4 values: "Entire home/apt", "Private room", "Shared room", "Hotel"|
|neighbourhood_goup|the neighbourhood group as geocoded using the latitude and longitude against neighborhoods as defined by open or public digital shapefiles|
|number_of_guests|the maximum number of guest the propery can accommodate|
|number_of_bathrooms|the number of bathrooms of the property|
|bathroom_type|dummy variable to indicate whether the bathroom(s) are private or shared|
|number_of_bedrooms|the number of bedrooms of the property|
|number_of_beds|the number of beds of the property|
|review_score_rating|the review score rating of the property (on a 5-point scale)|
|instant_bookable|dummy indicating whether the property can be booked automatically or the host's approval is needed|
|days_left|the number of days left until the booking starts|
|season|dummy indicating the season (Hawaii only has two seasons: summer (May-October) and winter (November-April)|

Overview of other variables used to merge different datasets or aggregate the data:
|Variable |Used for:|
|---------|----------|
|id|merging the listings and the calegdar datasets|
|date|aggregating the datasets per season|

Data dictionary of the raw datasets can be found [here](https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit#gid=1322284596).

### Research Method
We use regression analysis to examine the effects of the propery characteristics and time until booking starts on the listing price. We are interested in which property characteristics drive the price up or down and which have the largest effects. The dependent variable is the listing price of the Hawaiian Airbnb listing. The independent variables are given in the table above. The general regression equation can be summarized as follows:

_Y = β0 + β1room_type + β2neighbourhood_goup + β3number_of_guests + β4number_of_bathrooms + β5bathroom_type + β6number_of_bedrooms + β7number_of_beds + β8review_score_rating + β9instant_bookable + β10days_left + ε_

However, in practice the variables room_type and neighbourhood_goup have been recoded into three dummy variables each to refer to three of the four possible values (one remaining the baseline).The variables bathroom_type and instant_bookable are also dummies, but with only two levels. 

## Repository overview 
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
## Team 10 Data Preparation & Workflow Management
- Alexandra Bock [a.bock@tilburguniversity.edu]
- Koray Kul [a.b.luca@tilburguniversity.edu]
- Ana Luca [k.kul@tilburguniversity.edu]
- Merel van Stekelenburg [m.vanstekelenburg@tilburguniversity.edu]
