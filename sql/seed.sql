INSERT INTO instrutores (nome, email, telefone, especialidade, ativo) VALUES
	('Ricardo Silva', 'ricardo.coach@email.com', '84999998888', 'Maratona', true),
	('Mariana Souza', 'mariana.run@email.com', '84988887777', 'Velocidade', true),
	('Carlos Lima', 'carlos.tri@email.com', '84977776666', 'Triatlo', true),
	('Ana Paula', 'ana.paula@email.com', '84966665555', 'Trail Run', false);


INSERT INTO alunos (nome, email, data_nascimento, nivel_condicionamento, instrutor_id, ativo) VALUES
	('Bruno Alves', 'bruno@email.com', '1990-10-20', 'intermediario', 1, true),
	('Carla Souza', 'carla@email.com', '1988-03-12', 'avancado', 1, true),
	('Diego Lima', 'diego@email.com', '2000-01-05', 'iniciante', 2, true),
	('Elena Vaz', 'elena@email.com', '1992-07-22', 'intermediario', 3, true);

 
INSERT INTO grupos (nome, descricao, id_instrutor) VALUES
	('Foco 5km', 'Grupo para iniciantes em 5km', 1),
	('Elite 21km', 'Preparação para Meia Maratona', 1),
	('Sprint Noturno', 'Treinos de tiro à noite', 2),
	('Trilha Sábado', 'Treinos em terreno irregular', 4);

 
INSERT INTO aluno_grupo (id_aluno, id_grupo, data_entrada, ativo) VALUES
	(1, 1, '2024-01-10', true),
	(2, 2, '2024-01-15', true),
	(3, 3, '2024-02-01', true),
	(4, 4, '2024-02-10', true);

 
INSERT INTO planos (tipo_periodo, tipo_acomp, valor, descricao, ativo) VALUES
	('mensal', 'individual', 150.00, 'Acompanhamento Individual Mensal', true),
	('trimestral', 'grupo', 250.00, 'Treino em Grupo Trimestral', true),
	('semestral', 'individual', 750.00, 'Plano Premium Semestral', true),
	('mensal', 'grupo', 100.00, 'Plano Econômico Mensal', true);

 
INSERT INTO contratos (id_aluno, id_plano, data_inicio, data_fim, status) VALUES
	(1, 1, '2024-03-01', '2024-04-01', 'ativo'),
	(2, 3, '2024-01-01', '2024-07-01', 'ativo'),
	(3, 2, '2023-12-01', '2024-03-01', 'encerrado'),
	(4, 4, '2024-03-15', '2024-04-15', 'ativo');

 
INSERT INTO cronogramas (semana_ref, meta_km, descricao, id_aluno, id_grupo) VALUES
	('2024-04-08', 35.00, 'Treino focado em resistência', 1, NULL),
	('2024-04-08', 20.00, 'Treino coletivo de base', NULL, 1),
	('2024-04-15', 42.00, 'Simulado de Maratona', 2, NULL),
	('2024-04-15', 15.00, 'Recuperação Ativa', NULL, 3);

 
INSERT INTO treinos (id_cronograma, id_aluno, data, distancia_km, duracao_min, status) VALUES
	(1, 1, '2024-04-08', 10.50, 60, 'concluido'),
	(2, 1, '2024-04-09', 5.00, 30, 'concluido'),
	(3, 2, '2024-04-15', 21.00, 115, 'concluido'),
	(4, 3, '2024-04-16', 0.00, 20, 'cancelado');
	