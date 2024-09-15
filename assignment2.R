# Load the necessary libraries
library(DBI)
library(RMySQL)

# Connect to the MySQL database
connect = dbConnect(RMySQL::MySQL(), 
                 dbname = "assignment_2", 
                 host = "localhost", 
                 user = "your_username",   # Replace with your MySQL username
                 password = "your_password")  # Replace with your MySQL password

# SQL query to retrieve the data from the movie_ratings table
query = "SELECT * FROM movie_ratings"

# Store the result of the query in a dataframe
movie_ratings = dbGetQuery(connect, query)

# Display the first few rows of the dataframe
head(movie_ratings)


# Split function to extract the ratings of each movie
list_of_ratings = split(movie_ratings$rating, movie_ratings$movie_title)

# Display the list of ratings by movie
list_of_ratings

# Calculate the median rating for each movie
median_ratings = aggregate(rating ~ movie_title, data = movie_ratings, FUN = median)

# Display the new data frame with median ratings
median_ratings

# Load ggplot2 for visualization
library(ggplot2)

# Create the bar plot to visualize the median ratings by movie
ggplot(median_ratings, aes(x = movie_title, y = rating)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels for readability
  labs(title = "Median Ratings by Movie",
       x = "Movie Title",
       y = "Median Rating")

       # Creating a genre key for each movie
genre_key = c("fantasy", "interactive", "sci_fi", "comedy", "drama", "comedy")
names(genre_key) = median_ratings$movie_title

# Convert the genre key into a data frame for merging
genre_df = data.frame(movie_title = names(genre_key), genre = genre_key)

# Merging the genre data with the movie_ratings data frame
movie_ratings = merge(movie_ratings, genre_df, by = "movie_title")

# Display the updated data frame
head(movie_ratings)
unique(movie_ratings$movie_title)

# Using ggplot to plot the rating distribution across genres
ggplot(movie_ratings, aes(x = genre, y = rating, color = ind_name)) +
  geom_jitter(width = 0.3, height = 0) +
  labs(title = "Distribution of Ratings by Genre",
       x = "Genre",
       y = "Rating") +
  theme(legend.position = "bottom")

  # Loading the dplyr library for data manipulation
library(dplyr)

# Grouping the data by individual person and genre, then summarizing the average rating per genre
aggregated_ratings = movie_ratings %>%
  group_by(ind_name, genre) %>%
  summarise(avg_rating = mean(rating)) %>%
  ungroup()

# Display the aggregated data
aggregated_ratings


# Creating a heatmap to visualize average ratings by genre for each individual
ggplot(aggregated_ratings, aes(x = ind_name, y = genre)) +
  geom_tile(aes(fill = avg_rating), color = "white") +
  scale_fill_gradient(low = "white", high = "steelblue") +
  labs(title = "Average Ratings Heatmap",
       x = "Individual",
       y = "Genre")
