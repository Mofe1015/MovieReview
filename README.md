# Movie Review App

This document provides instructions the movie review test project

## Application Setup

```
bundle install
rails db:create
rails db:migrate
rails db:seed
```

## Project Goals and Objectives

You are tasked with expanding a basic movie review system. Currently, the project includes a movies view with 10 preloaded movies. Your goal is to implement a feature that allows users to rate each movie across three categories.

### Categories and Rating Scale

Users should rate movies in the following three categories, each on a scale from 1 to 5:

- Performance
- Special Effects
- Storytelling

All categories are equally weighted.

### Functionality Requirements

- Rating Submission:

  Users can submit ratings anonymously, with no need to create or track user accounts.
  Users can submit multiple reviews for the same movie.

- Display Ratings:

  After a review is submitted, display both the individual category scores and the total score.
  The total score should be the equally weighted average of the three categories. For example, if the scores are Performance = 3, Special Effects = 4, and Storytelling = 5, then the Total Score should be 4.

- Additional rating categories:

  In the future, we plan to introduce new rating categories for movies. Your implementation should be designed to easily accommodate the addition of these new categories.
  For now, you do not need to implement the functionality for adding new categories. Just ensure that your current design can support this feature when it becomes necessary.

- Overall rating:

  Display the average rating for each movie based on all submitted reviews. This should include an overall average score as well as the average score for each individual category.

### Time Estimate

This project should take approximately 2-3 hours. Focus primarily on functionality rather than design or usability at this stage.

## Submitting the project

Clone or copy the project to a private repo. Once it is ready you can either share access or zip up the project locally and send it via email to mikewalters@hetalretail.com

Here's the updated README with a section on how to easily create a new category based on the current setup:

---

# Movie Review System Mofes Explanation

## Overview

This application allows users to browse movies and submit ratings across various categories. The ratings are averaged to provide insights into individual aspects of the movies, as well as a total score.

## Features

- **Movie Listing**: Users can view a list of movies, including their average ratings.
- **Rating Submission**: Users can submit ratings for movies based on predefined categories: Performance, Special Effects, and Storytelling.
- **Dynamic Calculations**: Average scores for each category and total scores are calculated and displayed dynamically based on user submissions.

## Database Schema

### Tables

1. **Movies**: Stores information about movies.
2. **Categories**: Stores categories for ratings (e.g., Performance, Special Effects, Storytelling).
3. **Movie Ratings**: Associates movies with their ratings and scores.
4. **Movie Rating Categories**: Links specific scores to categories for each movie rating.

## Implementation Steps

1. **Database Setup**: Defined the necessary database tables and relationships to manage movies and their ratings.
2. **Models**:
   - **Movie**: Implemented methods to calculate average scores for each category and the total score.
   - **MovieRating**: Represents a user's rating submission for a specific movie, linking to the rating categories.
3. **Controllers**:
   - **MovieRatingsController**: Handled the creation of ratings and ensured that users could submit their reviews correctly.
4. **Views**:
   - **Movie Index View**: Displayed a list of movies along with their average category scores and total score.
   - **Movie Show View**: Allowed users to rate a movie and displayed individual scores along with the total score.

## Key Methods

### Movie Model Methods

- **average_score_for_category(category_id)**: Calculates the average score for a specific category across all ratings for the movie.
- **total_average_score**: Calculates the overall average score based on all categories.
- **average_scores**: Returns a list of average scores for all categories associated with the movie.

## Easy Category Creation

Adding a new rating category is straightforward due to the modular setup of the application:

1. **Add Category**: Simply create a new entry in the `categories` table. This can be done through a Rails console or by adding a form in the application for category management.
2. **Automatic Integration**: Once a new category is added, it will automatically be available for rating submissions without requiring changes in other parts of the codebase.
3. **Dynamic Display**: The application dynamically fetches all categories, so new categories will appear in the rating forms and summary views without additional code modifications.
