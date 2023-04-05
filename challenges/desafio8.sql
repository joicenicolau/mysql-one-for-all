SELECT 
-- artista e album pelo nome
  at.artista_name AS artista, 
  ab.album_name AS album
FROM
  SpotifyClone.artistas AS at
-- compara o album com o artista 
  INNER JOIN SpotifyClone.albuns AS ab ON ab.artista_id = at.artista_id
-- buscar pelo artista específico  
WHERE at.artista_name = 'Elis Regina'
GROUP BY 
  artista,
  album
ORDER BY
-- ordenados pelo nome do álbum em ordem alfabética.
  album;
