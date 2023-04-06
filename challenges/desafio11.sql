SELECT 
  ab.album_name AS album,
  COUNT(f.cancao_id) AS favoritadas
FROM
  SpotifyClone.albuns AS ab
  LEFT JOIN SpotifyClone.cancoes AS c ON ab.album_id = c.album_id
  LEFT JOIN SpotifyClone.favoritos AS f ON f.cancao_id = c.cancao_id
GROUP BY 
  album
ORDER BY
  favoritadas DESC,
  album
LIMIT 
  3;