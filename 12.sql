SELECT c.champion_name as champion_name,tmp1.cnt as cnt
FROM champ as c,
(SELECT t.champion_id as champion_id,COUNT(t.champion_id) as cnt
FROM teamban as t
GROUP by t.champion_id
) as tmp1
WHERE c.champion_id=tmp1.champion_id
ORDER BY tmp1.cnt DESC
LIMIT 10;


SELECT c.champion_name as champion_name,tmp1.cnt as cnt
FROM champ as c,
(SELECT t.champion_id as champion_id,COUNT(t.champion_id) as cnt
FROM teamban as t
WHERE t.banturn=1
GROUP by t.champion_id
) as tmp1
WHERE c.champion_id=tmp1.champion_id
ORDER BY tmp1.cnt DESC
LIMIT 10;

SELECT c.champion_name as champion_name,tmp1.cnt as cnt
FROM champ as c,
(SELECT t.champion_id as champion_id,COUNT(t.champion_id) as cnt
FROM teamban as t
WHERE t.banturn=2
GROUP by t.champion_id
) as tmp1
WHERE c.champion_id=tmp1.champion_id
ORDER BY tmp1.cnt DESC
LIMIT 10;


