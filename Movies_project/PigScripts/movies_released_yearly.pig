movies_input = load '/user/edureka_572865/project/movies_dataset_pig.txt' using PigStorage(',') as (id:int, name:chararray, year:int, rating:float, duration:long);
movies_year = group movies_input by year;
count_year = foreach movies_year generate $0, COUNT($1.$2);
dump count_year;
