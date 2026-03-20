# Personality Traits and Social Media Engagement Analysis

This project analyzes the relationship between Big Five personality traits and online behavior, specifically focusing on how specific traits correlate with problem-solving discussions and social media platform preferences.

## Project Overview
The study processes raw survey data to calculate standardized scores for the five major personality domains: Openness, Conscientiousness, Extraversion, Agreeableness, and Neuroticism. By merging psychometric scores with behavioral survey data, the project identifies how personality influences digital engagement.

## Statistical Findings
The analysis utilized the **Kruskal-Wallis Rank Sum Test** to identify significant differences across groups. Key results include:

### 1. Agreeableness and Online Problem Solving
* **Trend:** The analysis explored whether users who "Agree Strongly" with helping solve problems online possess higher Agreeableness scores. 
* **Observation:** Median calculations (via the `aggregate` function) show how the Agreeableness rating shifts across different response levels. A significant Kruskal-Wallis p-value indicates that a user's willingness to help others online is a strong indicator of their core Agreeableness trait.

### 2. Openness and Social Media Selection
* **Platform Distribution:** The data shows a varied distribution of users across Facebook, Reddit, TikTok, and X.
* **Openness Scores:** The Kruskal-Wallis test was used to determine if "Openness to Experience" scores differ significantly depending on a user's primary platform for news.
* **Results:** The analysis highlights which platforms (such as Reddit or X) attract users with higher median Openness ratings compared to more mainstream platforms like Facebook.

## Project Structure
* **Code Compilation:** A Jupyter Notebook environment utilizing the R Kernel to perform end-to-end data cleaning, statistical modeling, and visualization.
* **Data Sources:**
    * **PersonalityResponses.xlsx**: Excel file containing raw 44-item Big Five inventory responses.
    * **QuestionnaireResponses.xlsx**: Excel file containing behavioral and social media usage data.

## Data Processing Workflow

### 1. Data Cleaning & Personality Scoring
* **Input:** PersonalityResponses.xlsx.
* **Recoding:** Converts Likert-scale text responses (e.g., "Disagree Strongly") into numeric values (1-5).
* **Reverse-Coding:** Automatically adjusts scores for 16 specific items (e.g., items 2, 6, 8, 9, etc.) to ensure directional consistency.
* **Aggregating:** Calculates the mean score for each personality trait per Student ID.

### 2. Dataset Integration
* Merges personality scores with behavioral data from QuestionnaireResponses.xlsx based on StudentID.
* Handles missing values using listwise deletion (`na.omit`) to ensure statistical integrity.

## Technologies Used
* **Analysis Environment:** Jupyter Notebook (R Kernel)
* **Language:** R
* **Data Management:** Microsoft Excel
* **Core Libraries:** readxl, stats

## Contributors
* Ezekiel Eduard Dumago
* Krisha Lei Sabado
* Angus Dylan Simbulan
