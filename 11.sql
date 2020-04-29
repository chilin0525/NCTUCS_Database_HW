SELECT 'Flash and Ignite' as ss1_ss2,SUM(s.win=1)/COUNT(*) as win_ratio
FROM participant as p,stat as s
WHERE p.player_id=s.player_id AND ((p.ss1='Flash' AND p.ss2='Ignite') OR (p.ss1='Ignite' AND p.ss2='Flash')) AND p.position='TOP'
UNION
SELECT 'Flash and Teleport' as ss1_ss2,SUM(s.win=1)/COUNT(*) as win_ratio
FROM participant as p,stat as s
WHERE p.player_id=s.player_id AND ((p.ss1='Flash' AND p.ss2='Teleport') OR (p.ss1='Teleport' AND p.ss2='Flash')) AND p.position='TOP';
