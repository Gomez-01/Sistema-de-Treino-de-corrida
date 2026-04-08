SELECT DISTINCT 
    a.nome, 
    t.distancia_km, 
    c.meta_km
FROM alunos a
JOIN treinos t ON a.id_aluno = t.id_aluno
JOIN cronogramas c ON t.id_cronograma = c.id_cronograma
WHERE t.status = 'concluido' 
AND t.distancia_km > c.meta_km;