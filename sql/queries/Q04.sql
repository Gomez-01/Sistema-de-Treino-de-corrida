SELECT 
    g.nome AS nome_grupo, 
    COUNT(ag.id_aluno) AS quantidade_alunos
FROM grupos g
LEFT JOIN aluno_grupo ag ON g.id_group = ag.id_grupo
GROUP BY g.id_group, g.nome;