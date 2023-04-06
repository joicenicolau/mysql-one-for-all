SELECT 
  at.artista_name AS artista, 
  ab.album_name AS album
FROM
  SpotifyClone.artistas AS at
  INNER JOIN SpotifyClone.albuns AS ab ON ab.artista_id = at.artista_id
WHERE at.artista_name = 'Elis Regina'
GROUP BY 
  artista,
  album
ORDER BY
  album;
