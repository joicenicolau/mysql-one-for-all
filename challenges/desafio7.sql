SELECT 
  at.artista_name AS artista, 
  ab.album_name AS album,
  COUNT(u.usuario_id) AS pessoas_seguidoras
FROM
  SpotifyClone.artistas AS at
  INNER JOIN SpotifyClone.albuns AS ab ON ab.artista_id = at.artista_id
  INNER JOIN SpotifyClone.seguidores AS u ON u.artista_id =  at.artista_id
GROUP BY 
  artista,
  album
ORDER BY
  pessoas_seguidoras DESC,
  artista,
  album;
