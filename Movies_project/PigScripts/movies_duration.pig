movies_input = load '/user/edureka_572865/project/movies_dataset_pig.txt' using PigStorage(',') as (id:int, name:chararray, year:int, rating:float, duration:long);
movie_duration = filter movies_input by duration>7200l;
group_movie_duration = group movie_duration by duration;
count_duration = foreach group_movie_duration generate COUNT($1.$4);
group_count = group count_duration all;
sum_count = foreach group_count generate SUM($1);
dump sum_count;
