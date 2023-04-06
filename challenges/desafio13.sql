SELECT
  CASE 
    WHEN u.usuario_age > 60 THEN 'Maior de 60 anos'
    WHEN u.usuario_age BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
    WHEN u.usuario_age BETWEEN 1 AND 30 THEN 'Até 30 anos'
    ELSE 0
  END AS faixa_etaria,
  COUNT(DISTINCT u.usuario_id) AS total_pessoas_usuarias,
  COUNT(f.cancao_id) AS total_favoritadas
FROM 
  SpotifyClone.usuarios AS u
  LEFT JOIN SpotifyClone.favoritos AS f ON f.usuario_id = u.usuario_id
GROUP BY 
  faixa_etaria
ORDER BY
  faixa_etaria;