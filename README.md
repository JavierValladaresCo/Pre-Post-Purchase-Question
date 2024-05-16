# Data Visualization Pre & Post Purchase Questions.

Pre- and post-purchase product questions was accessed on 15/05/2024 from https://registry.opendata.aws/pre-post-purchase-questions 

![Amazon](/Images/Amazon_logo.jpg "Amazon Logo")


## Methods Used

 - Data Visualization 

## Technologies

- Power BI
- Power Query
- MySQL


## Needs of this project

- Data processing/cleaning
- Data exploration/descriptive statistics

## Conclusions

![Dashboard](/Images/Amazon_Dashboard.jpg "Dashboard")

## Challenges

Part of the challenges faced in this project involved data cleaning. Because when we're working with text data, it's common to detect the presence of sligthly different texts or special characters that subtly modify the texts.

Additionally, it was necessary to analyze and clean the hours differences between post-purchase and pre-purchase questions. Some hours differences exceeded a year and a half, enough time in which the product might no longer be available on the platform. Besides, 80% of the observed hour differences fell within the range of [-400,0) hours for pre-purchase questions and (0,8000] hours for post-purchase questions, as we can observe in the figures. To address this, we removed the top 5% of hour differences for both cases. This was done to obtain a more balanced distribution of this data.

![Dashboard](/Images/Pre-Purchase-Question-Relative-Position.png "Pre Relative Position")

![Dashboard](/Images/Post-Purchase-Question-Relative-Position.png "Post Relative Position")



## What else i might have done?

One additional aspect I would have explored in this project is to leveraging the item names. By creating subcategories based on the item names, we could aim to identify categories with the highest number of pre-purchase-questions and post-purchase-questions. This approach would offer deeper insights into consumer behavior patterns and preferences, allowing for more targeted marketing strategies and product optimization efforts.


## Authors

- [@JavierValladaresCo](https://www.github.com/JavierValladaresCo)
