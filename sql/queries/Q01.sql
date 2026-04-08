--Listar todos os alunos de um instrutor específico
SELECT a.nome AS nome_aluno
FROM alunos a
JOIN instrutores i ON a.instrutor_id = i.id_instrutor
WHERE i.nome = 'Nome do Instrutor';

