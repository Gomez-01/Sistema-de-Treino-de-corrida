-- Mostrar todos os treinos de um aluno em um mês específico

SELECT t.data, t.distancia_km, c.semana_ref, c.descricao AS descricao_cronograma
FROM treinos t
JOIN cronogramas c ON t.id_cronograma = c.id_cronograma
WHERE t.id_aluno = 1 -- Substitua pelo id do aluno
AND EXTRACT(MONTH FROM t.data) = 1 -- Substitua pelo mês
