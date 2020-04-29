SELECT m.match_id as match_id,SEC_TO_TIME(m.duration) as time
FROM match_info as m
ORDER BY m.duration DESC
limit 5;
