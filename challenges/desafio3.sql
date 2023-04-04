SELECT 
  u.usuario_name AS pessoa_usuaria, 
  -- quantidade de canções = COUNT + DISTINCT (conta as canções sem repetir)
  COUNT(DISTINCT h.cancao_id) AS musicas_ouvidas,
  -- a soma dos minutos ouvidos (temos em segundos, então / 60) + round para arredondar para 2 casas decimais
  ROUND(SUM(c.cancao_length / 60), 2) AS total_minutos
FROM
  -- exibir o nome do usuário e exibir na coluna 'pessoa_usuaria'
  SpotifyClone.usuarios AS u
  -- fazer a junção do historico de reprodução de cada usuario, para fazer a contagem dos valores que se correspondem
  INNER JOIN SpotifyClone.historico_reproducao AS h ON h.usuario_id = u.usuario_id
  -- fazer a junção do histórico de minutos ouvidos com a quantidade reproduzida, para fazer na soma dos valores que se correspondem
  INNER JOIN SpotifyClone.cancoes AS c ON h.cancao_id = c.cancao_id
-- Os resultados devem estar agrupados pelo nome da pessoa usuária 
GROUP BY 
  pessoa_usuaria
-- ordenados em ordem alfabética
ORDER BY 
  pessoa_usuaria;
