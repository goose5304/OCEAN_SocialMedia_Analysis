# Personality Traits and Social Media Engagement Analysis

This project analyzes the relationship between Big Five personality traits and online behavior, specifically focusing on how agreeableness and openness correlate with problem-solving discussions and social media platform preferences.

## Project Overview
The study processes raw survey data to calculate standardized scores for the five major personality domains:
* Openness to Experience
* Conscientiousness
* Extraversion
* Agreeableness
* Neuroticism

It then utilizes non-parametric statistical methods to determine if these personality scores differ significantly across various behavioral groups.

## Project Structure
* **Code Compilation:** A Jupyter Notebook environment utilizing the R Kernel to perform end-to-end data cleaning, statistical modeling, and visualization.
* **Data Sources:**
    * **PersonalityResponses.xlsx**: Excel file containing raw 44-item Big Five inventory responses.
    * **QuestionnaireResponses.xlsx**: Excel file containing behavioral and social media usage data.

## Data Processing Workflow

### 1. Data Cleaning & Personality Scoring
* **Input:** PersonalityResponses.xlsx.
* **Recoding:** Converts Likert-scale text responses into numeric values (1-5).
* **Reverse-Coding:** Automatically adjusts scores for specific items to ensure directional consistency across the traits.
* **Aggregating:** Calculates the mean score for each personality trait per Student ID.

### 2. Dataset Integration
* Merges personality scores with behavioral data from QuestionnaireResponses.xlsx based on StudentID.
* Handles missing values using listwise deletion to ensure statistical integrity.

## Statistical Analysis

### Agreeableness vs. Problem Solving
* **Question:** "I often engage in online discussions to help solve specific problems."
* **Methods:** Frequency tables, median calculations, scatterplots, and boxplots.
* **Test:** Kruskal-Wallis Rank Sum Test to identify differences in Agreeableness ratings across agreement levels.

### Openness vs. Social Media Preference
* **Question:** "Which of these social media platforms do you mostly browse for news and online discussions?"
* **Visualizations:**
    * **Pie Chart:** Distribution of platform usage (Facebook, Reddit, TikTok, X).
    * **Boxplot:** Openness scores distributed by preferred platform.
* **Test:** Kruskal-Wallis Rank Sum Test to determine if specific platforms attract users with higher Openness ratings.

## Technologies Used
* **Analysis Environment:** Jupyter Notebook
* **Language:** R
* **Data Management:** Microsoft Excel
* **Core Libraries:** readxl, stats

## Contributors
* Ezekiel Eduard Dumago
* Krisha Lei Sabado
* Angus Dylan Simbulan
