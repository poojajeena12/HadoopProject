input_data = load '/user/edureka_572865/project/youtubedata.txt' using PigStorage('\t') as (id:chararray, uploader:chararray, time_interval:long, category:chararray, length:int, views:int, rating:float, num_rating:int, comments:int, related_vid:chararray);

group_category = group input_data by category;
category_count = foreach group_category generate $0, COUNT($1.$0);
order_category = order category_count by $1 DESC;
top5_videos = LIMIT order_category 5;
dump top5_videos;
