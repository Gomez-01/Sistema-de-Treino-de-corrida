SELECT a.nome, a.email
FROM alunos a
LEFT JOIN contratos c ON a.id_aluno = c.id_aluno AND c.status = 'ativo'
WHERE c.id_contrato IS NULL;
