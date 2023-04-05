-- quantidade de músicas que estão presentes atualmente no histórico de reprodução de uma pessoa usuária específica.
SELECT 
  --  quantidade de cancções no histórico
  COUNT(h.cancao_id) AS musicas_no_historico
FROM
  SpotifyClone.historico_reproducao AS h
-- compara o historico com o usuario
  RIGHT JOIN SpotifyClone.usuarios AS u ON u.usuario_id = h.usuario_id
-- buscar pelo usuário específico  
WHERE u.usuario_name = 'Barbara Liskov';