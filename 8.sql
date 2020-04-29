SELECT c.champion_name
FROM champ as c
WHERE c.champion_id 
NOT IN(
	SELECT b.champion_id 
	FROM teamban as b,match_info as m
	WHERE m.match_id=b.match_id AND SUBSTRING_INDEX(m.version,'.',2)=7.7
)
ORDER BY c.champion_name ASC;
