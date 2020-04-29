SELECT COUNT(DISTINCT SUBSTRING_INDEX(m.version,'.',2)) as cnt
FROM match_info as m;
