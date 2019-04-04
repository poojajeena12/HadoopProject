
movies_input = load '/user/edureka_572865/project/movies_dataset_pig.txt' using PigStorage(',') as (id:int, name:chararray, year:int, rating:float, duration:long);
movies_year = filter movies_input by year>1950 AND year<1960;
group_movies_year = group movies_year by year;
movies_count = FOREACH group_movies_year generate COUNT($1.$2);
group_count = group movies_count all;
sum_year = foreach group_count generate SUM($1);
dump sum_year;
