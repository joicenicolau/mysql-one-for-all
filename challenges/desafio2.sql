SELECT 
  COUNT(DISTINCT c.cancao_id) AS cancoes,
  COUNT(DISTINCT at.artista_id) AS artistas, 
  COUNT(DISTINCT ab.album_id) AS albuns
FROM
  SpotifyClone.cancoes AS c,
  SpotifyClone.artistas AS at,
  SpotifyClone.albuns AS ab; 
