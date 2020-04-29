SELECT temp5.position as position,c.champion_name as champion_name,temp6.kda as kda
FROM champ as c,
(SELECT temp2.position as position,MAX(temp2.kda) as maxkda
FROM(
SELECT temp.position,temp.champion_id as champion_id,temp.ka/temp.death as kda,temp.ka as ka,temp.death as death
FROM(
	SELECT p.position,p.champion_id,(SUM(s.kills)+SUM(s.assists)) as ka,SUM(s.deaths) as death
	FROM participant as p,stat as s
	WHERE s.player_id=p.player_id AND (p.position='DUO_CARRY' OR p.position='DUO_SUPPORT' OR p.position='JUNGLE' OR p.position='MID' OR p.position='TOP')
	GROUP BY p.position,p.champion_id
)as temp
WHERE temp.death!=0) as temp2
GROUP BY temp2.position) as temp5,
(SELECT temp.position,temp.champion_id as champion_id,temp.ka/temp.death as kda
FROM(
	SELECT p.position,p.champion_id,(SUM(s.kills)+SUM(s.assists)) as ka,SUM(s.deaths) as death
	FROM participant as p,stat as s
	WHERE s.player_id=p.player_id AND (p.position='DUO_CARRY' OR p.position='DUO_SUPPORT' OR p.position='JUNGLE' OR p.position='MID' OR p.position='TOP')
	GROUP BY p.position,p.champion_id
)as temp
WHERE temp.death!=0) as temp6
WHERE temp5.maxkda LIKE temp6.kda AND c.champion_id=temp6.champion_id
ORDER BY temp5.position ASC;
