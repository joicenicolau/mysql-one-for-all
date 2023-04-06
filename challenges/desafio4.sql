SELECT 
  u.usuario_name AS pessoa_usuaria, 
  IF(MAX(h.date) >= '2021-01-01 00:00:00', 'Ativa', 'Inativa')
  AS status_pessoa_usuaria
FROM
  SpotifyClone.usuarios AS u
  LEFT JOIN SpotifyClone.historico_reproducao AS h ON h.usuario_id = u.usuario_id
GROUP BY 
  pessoa_usuaria
ORDER BY 
  pessoa_usuaria;