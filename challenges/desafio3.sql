SELECT 
  u.usuario_name AS pessoa_usuaria, 
  COUNT(DISTINCT h.cancao_id) AS musicas_ouvidas,
  ROUND(SUM(c.cancao_length / 60), 2) AS total_minutos
FROM
  SpotifyClone.usuarios AS u
  INNER JOIN SpotifyClone.historico_reproducao AS h ON h.usuario_id = u.usuario_id
  INNER JOIN SpotifyClone.cancoes AS c ON h.cancao_id = c.cancao_id
GROUP BY 
  pessoa_usuaria
ORDER BY 
  pessoa_usuaria;
