SELECT 
-- artista e album pelo nome
  at.artista_name AS artista, 
  ab.album_name AS album,
-- terceira coluna exibe quantidade de pessoas seguidoras
  COUNT(u.usuario_id) AS pessoas_seguidoras
FROM
-- OBS: tive problemas com a ordem do AS. Tabela artista teve que vir primeiro
  SpotifyClone.artistas AS at
-- compara o album com o artista 
  INNER JOIN SpotifyClone.albuns AS ab ON ab.artista_id = at.artista_id
-- compara a tabela seguidor com a do artista e faz o count  
  INNER JOIN SpotifyClone.seguidores AS u ON u.artista_id =  at.artista_id
-- agrupar somente aquilo que vou ordenar por ordem alfabética
GROUP BY 
  artista,
  album
ORDER BY
-- ordenados de forma decrescente, baseando-se no número de pessoas seguidoras
  pessoas_seguidoras DESC,
  -- ordene os resultados pelo nome da pessoa artista em ordem alfabética 
  artista,
  -- caso existam artistas com o mesmo nome, ordene os resultados pelo nome do álbum alfabeticamente
  album;
