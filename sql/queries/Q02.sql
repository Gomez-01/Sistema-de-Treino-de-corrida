-- Exibir os alunos e seus planos ativos (contrato vigente)

SELECT a.nome AS nome_aluno, p.tipo_periodo, p.tipo_acomp, p.valor
FROM alunos a
JOIN contratos c ON a.id_aluno = c.aluno
JOIN planos p ON c.id_plano = p.id_plano
WHERE c.status = 'ativo';