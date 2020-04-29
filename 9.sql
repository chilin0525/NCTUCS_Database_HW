SELECT SUBSTRING_INDEX(m.version,'.',2) as version,SUM(s.win=1) as win_cnt,SUM(s.win=0) as lose_cnt,sum(s.win=1)/(SUM(s.win=1)+SUM(s.win=0)) as win_ratio
FROM stat as s,
	match_info as m,
(SELECT p.match_id,temp.player_id
FROM participant as p,
	(SELECT p.match_id,p.player,p.player_id
	FROM participant as p
	WHERE p.champion_id=64) as temp
WHERE p.champion_id=17 AND temp.match_id=p.match_id AND ((temp.player<=5 AND p.player<=5)OR(temp.player>5 AND p.player>5))) as temp2
WHERE s.player_id=temp2.player_id AND m.match_id=temp2.match_id
GROUP BY SUBSTRING_INDEX(m.version,'.',2)
ORDER BY SUBSTRING_INDEX(m.version,'.',2) ASC;
