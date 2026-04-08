SELECT 
    a.nome, 
SUM(t.distancia_km) AS total_km_mes
FROM alunos a
JOIN treinos t ON a.id_aluno = t.id_aluno
WHERE t.status = 'concluido' 
AND t.data >= date_trunc('month', CURRENT_DATE)
GROUP BY a.id_aluno, a.nome;