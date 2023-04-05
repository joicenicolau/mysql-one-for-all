SELECT 
  c.cancao_name AS cancao, 
  -- quantidade de canções = COUNT 
  COUNT(h.cancao_id) AS reproducoes
FROM
  SpotifyClone.cancoes AS c
  LEFT JOIN SpotifyClone.historico_reproducao AS h ON h.cancao_id = c.cancao_id
GROUP BY 
  cancao
ORDER BY 
--  ordenado em ordem decrescente, baseando-se no número de reproduções
 reproducoes DESC,
--  ordene os resultados pelo nome da canção em ordem alfabética
 cancao
-- apenas o top 2 de músicas mais tocadas
LIMIT
 2;
