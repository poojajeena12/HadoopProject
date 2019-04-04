movies_input = load '/user/edureka_572865/project/movies_dataset_pig.txt' using PigStorage(',') as (id:int, name:chararray, year:int, rating:float, duration:long);
grp = group movies_input all;
count_grp = foreach grp generate COUNT($1);
dump count_grp;
