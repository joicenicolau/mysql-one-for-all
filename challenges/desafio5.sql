SELECT 
  c.cancao_name AS cancao, 
  COUNT(h.cancao_id) AS reproducoes
FROM
  SpotifyClone.cancoes AS c
  LEFT JOIN SpotifyClone.historico_reproducao AS h ON h.cancao_id = c.cancao_id
GROUP BY 
  cancao
ORDER BY 
 reproducoes DESC,
 cancao
LIMIT
 2;
