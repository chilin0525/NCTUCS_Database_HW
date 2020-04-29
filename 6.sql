SELECT temp4.position as position,c.champion_name as champion_name
FROM
champ as c,
(SELECT temp2.position as position,MAX(cnt) as cnt
FROM
	(SELECT temp.position as position,temp.champion_id as champion_id,COUNT(temp.champion_id) as cnt
FROM
	(SELECT p.position as position,p.champion_id as champion_id
FROM match_info as m,participant as p
WHERE m.match_id=p.match_id AND m.duration BETWEEN 2400 AND 3000 AND (p.position='DUO_CARRY' OR p.position='DUO_SUPPORT' OR p.position='JUNGLE' OR p.position='MID' OR p.position='TOP')) as temp
GROUP BY temp.position,temp.champion_id) as temp2
GROUP BY temp2.position) as temp3,
(SELECT temp.position as position,temp.champion_id as champion_id,COUNT(temp.champion_id) as cnt
FROM
	(SELECT p.position as position,p.champion_id as champion_id
FROM match_info as m,participant as p
WHERE m.match_id=p.match_id AND m.duration BETWEEN 2400 AND 3000 AND (p.position='DUO_CARRY' OR p.position='DUO_SUPPORT' OR p.position='JUNGLE' OR p.position='MID' OR p.position='TOP')) as temp
GROUP BY temp.position,temp.champion_id) temp4
WHERE temp3.cnt=temp4.cnt AND c.champion_id=temp4.champion_id
ORDER BY temp4.position ASC;
