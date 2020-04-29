SELECT c.champion_name as self_champion_name,SUM(tmp1.win2=1)/(SUM(tmp1.win2=1)+SUM(tmp1.win2=0)) as win_ratio,(SUM(tmp1.assists2)+SUM(tmp1.kill2))/SUM(tmp1.deaths2) as self_kda,SUM(tmp1.goldearned2)/COUNT(*) as self_avg_gold,'Renekton' as enemy_champ_name,(SUM(s.kills)+SUM(s.assists))/SUM(s.deaths) as enemy_kda
,SUM(s.goldearned)/COUNT(*) as enemy_avg_gold,COUNT(*) as battle_record
FROM participant as p,stat as s,champ as c,
(SELECT p.player as player,p.match_id as match_id,p.player_id as player_id,p.champion_id as champion_id,s.player_id as player2_id,s.win as win2,s.goldearned as goldearned2,s.kills as kill2,s.assists as assists2,s.deaths as deaths2
FROM participant as p,stat as s
WHERE p.champion_id!=58 AND p.position='TOP' AND s.player_id=p.player_id
) as tmp1
WHERE p.champion_id=58 AND p.match_id=tmp1.match_id AND ((p.player>5 AND tmp1.player<=5) or (p.player<=5 AND tmp1.player>5)) AND s.player_id=p.player_id AND p.position='TOP' AND c.champion_id=tmp1.champion_id
GROUP BY p.champion_id,tmp1.champion_id
HAVING battle_record>100 AND SUM(s.deaths)!=0 AND SUM(tmp1.deaths2)!=0
ORDER BY win_ratio DESC
limit 5;
