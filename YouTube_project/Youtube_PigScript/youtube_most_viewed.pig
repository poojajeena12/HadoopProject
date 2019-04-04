input_data = load '/user/edureka_572865/project/youtubedata.txt' using PigStorage('\t') as (id:chararray, uploader:chararray, time_interval:long, category:chararray, length:int, views:int, rating:float, num_rating:int, comments:int, related_vid:chararray);
group_views = group input_data by views;
count_views = foreach group_views generate $1.$0, COUNT($1.$5);
order_count_views = order count_views by $1 DESC;
most_viewed_video = LIMIT order_count_views 5;
dump most_viewed_video;
