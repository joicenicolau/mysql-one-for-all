SELECT 
  COUNT(DISTINCT c.cancao_id) AS cancoes,
  COUNT(DISTINCT at.artista_id) AS artistas, 
  COUNT(DISTINCT ab.album_id) AS albuns
  -- exibir 3 colunas com os nomes cancoes, artistas, albuns = AS
  -- contar total de canções = COUNT
  -- DISTINCT para não repetir na contagem
FROM
  SpotifyClone.cancoes AS c,
  SpotifyClone.artistas AS at,
  SpotifyClone.albuns AS ab; 
