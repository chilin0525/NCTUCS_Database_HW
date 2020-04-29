SELECT if (temp.win=0,'lose','win') as win_lose
        ,count(temp.win) as cnt
FROM(
	SELECT p.match_id as tempmatch
              ,SUM(s.longesttimespentliving) as summ
              ,s.win as win
	FROM participant as p,stat as s
	WHERE p.player_id=s.player_id AND p.player>5 
	GROUP BY p.match_id,s.win
	UNION
	SELECT p.match_id as tempmatch
              ,SUM(s.longesttimespentliving) as summ,s.win as win
	FROM participant as p,stat as s
	WHERE p.player_id=s.player_id AND p.player<=5 
	GROUP BY p.match_id,s.win) as temp
WHERE temp.summ>=6000
GROUP BY temp.win;
