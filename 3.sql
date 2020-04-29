SELECT c.champion_name as champion_name,COUNT(p.champion_id) as cnt
FROM champ as c,participant as p
WHERE p.champion_id=c.champion_id AND p.position='JUNGLE'
GROUP BY champion_name
ORDER BY cnt DESC
LIMIT 3;
