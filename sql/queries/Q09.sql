SELECT 
    a.nome, 
    SUM(p.valor) AS total_pago
FROM alunos a
JOIN contratos c ON a.id_aluno = c.id_aluno
JOIN planos p ON c.id_plano = p.id_plano
GROUP BY a.id_aluno, a.nome;