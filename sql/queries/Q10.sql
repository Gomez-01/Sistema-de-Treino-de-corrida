SELECT 
    i.nome AS instrutor,
    COUNT(DISTINCT a.id_aluno) AS total_alunos_geral
FROM instrutores i
LEFT JOIN alunos a ON i.id_instrutor = a.instrutor_id
LEFT JOIN grupos g ON i.id_instrutor = g.id_instrutor
LEFT JOIN aluno_grupo ag ON g.id_group = ag.id_grupo
GROUP BY i.id_instrutor, i.nome;
