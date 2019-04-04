movies_input = load '/user/edureka_572865/project/movies_dataset_pig.txt' using PigStorage(',') as (id:int, name:chararray, year:int, rating:float, duration:long);
movies_rating = filter movies_input by rating>3f AND rating<4f;
group_movies_rating = group movies_rating by rating;
rating_count = foreach group_movies_rating generate COUNT($1.$3);
group_count = group rating_count all;
sum_count = foreach group_count generate SUM($1);
dump sum_count;
