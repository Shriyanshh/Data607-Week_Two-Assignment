CREATE DATABASE IF NOT EXISTS assignment_2;

USE assignment_2;

CREATE TABLE IF NOT EXISTS movie_ratings (
  ind_id INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  movie_title VARCHAR(45) NOT NULL,
  movie_rating INT NOT NULL,
  PRIMARY KEY (ind_id, movie_title)
);


INSERT INTO movie_ratings (ind_id, name, movie_title, movie_rating)
VALUES 
       (1, 'john', 'spider_man_across_the_spider_verse', 5),
       (1, 'john', 'john_wick_chapter_4', 4),
       (1, 'john', 'guardians_of_the_galaxy_vol_3', 3),
       (1, 'john', 'mission_impossible_dead_reckoning', 5),
       (1, 'john', 'oppenheimer', 4),
       (1, 'john', 'murder_mystery_2', 3),

       (2, 'sarah', 'spider_man_across_the_spider_verse', 4),
       (2, 'sarah', 'john_wick_chapter_4', 5),
       (2, 'sarah', 'guardians_of_the_galaxy_vol_3', 4),
       (2, 'sarah', 'mission_impossible_dead_reckoning', 4),
       (2, 'sarah', 'oppenheimer', 5),
       (2, 'sarah', 'murder_mystery_2', 4),

       (3, 'mark', 'spider_man_across_the_spider_verse', 3),
       (3, 'mark', 'john_wick_chapter_4', 5),
       (3, 'mark', 'guardians_of_the_galaxy_vol_3', 5),
       (3, 'mark', 'mission_impossible_dead_reckoning', 4),
       (3, 'mark', 'oppenheimer', 3),
       (3, 'mark', 'murder_mystery_2', 2),

       (4, 'emma', 'spider_man_across_the_spider_verse', 5),
       (4, 'emma', 'john_wick_chapter_4', 4),
       (4, 'emma', 'guardians_of_the_galaxy_vol_3', 4),
       (4, 'emma', 'mission_impossible_dead_reckoning', 5),
       (4, 'emma', 'oppenheimer', 4),
       (4, 'emma', 'murder_mystery_2', 3),

       (5, 'david', 'spider_man_across_the_spider_verse', 2),
       (5, 'david', 'john_wick_chapter_4', 3),
       (5, 'david', 'guardians_of_the_galaxy_vol_3', 4),
       (5, 'david', 'mission_impossible_dead_reckoning', 4),
       (5, 'david', 'oppenheimer', 5),
       (5, 'david', 'murder_mystery_2', 3);
