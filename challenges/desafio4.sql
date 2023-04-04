SELECT 
  u.usuario_name AS pessoa_usuaria, 
  -- Crie uma QUERY que deve mostrar as pessoas usuárias que estavam ativas a partir do ano de 2021, se baseando na data mais recente no histórico de reprodução.
  -- Criar uma condição + funções de agregação (aula 1 - seção 3)
  -- Usar o MAX, pois quero datas maiores ou iguais
  IF(MAX(h.date) >= '2021-01-01 00:00:00', 'Ativa', 'Inativa')
  AS status_pessoa_usuaria
FROM
  -- exibir o nome do usuário e exibir na coluna 'pessoa_usuaria'
  SpotifyClone.usuarios AS u
  -- fazer a junção do historico de reprodução de cada usuario, para ver o status
  -- foco em uma tabela só, pois só queremos dados de uma. A outra criei agora. 
  LEFT JOIN SpotifyClone.historico_reproducao AS h ON h.usuario_id = u.usuario_id
-- para agrupar os dados a pessoa usuária 
GROUP BY 
  pessoa_usuaria
-- resultado deve estar ordenado em ordem alfabética
ORDER BY 
  pessoa_usuaria;