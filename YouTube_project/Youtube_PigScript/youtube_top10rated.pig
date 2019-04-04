input_data = load '/user/edureka_572865/project/youtubedata.txt' using PigStorage('\t') as (id:chararray, uploader:chararray, time_interval:long, category:chararray, length:int, views:int, rating:float, num_rating:int, comments:int, related_vid:chararray);
most_rated = LIMIT (order input_data by rating DESC) 10;
top10_videos = foreach most_rated generate $0;
dump top10_videos;

