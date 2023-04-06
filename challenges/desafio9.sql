SELECT 
  COUNT(h.cancao_id) AS musicas_no_historico
FROM
  SpotifyClone.historico_reproducao AS h
  RIGHT JOIN SpotifyClone.usuarios AS u ON u.usuario_id = h.usuario_id
WHERE u.usuario_name = 'Barbara Liskov';