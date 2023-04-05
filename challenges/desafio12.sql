SELECT
-- O nome da pessoa artista
  a.artista_name AS artista,
  CASE 
    WHEN COUNT(f.cancao_id) >= 5 THEN 'A'
    WHEN COUNT(f.cancao_id) BETWEEN 3 AND 4 THEN 'B'
    WHEN COUNT(f.cancao_id) BETWEEN 1 AND 2 THEN 'C'
    ELSE '-'
  END AS ranking
FROM 
  SpotifyClone.artistas AS a
  LEFT JOIN SpotifyClone.albuns AS ab ON ab.artista_id = a.artista_id
  LEFT JOIN SpotifyClone.cancoes AS c ON ab.album_id = c.album_id
  LEFT JOIN SpotifyClone.favoritos AS f ON f.cancao_id = c.cancao_id
GROUP BY 
  artista
ORDER BY
-- ORDENAR BASEADO NA QUANTIDADE DE CANÇÕES FAVORITAS
  COUNT(f.cancao_id) DESC,
  artista;