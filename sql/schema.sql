
CREATE TABLE instrutores (
    id_instrutor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    especialidade VARCHAR(50),
    ativo BOOLEAN DEFAULT TRUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
	nivel_condicionamento VARCHAR(30) NOT NULL 
    CHECK (nivel_condicionamento IN ('iniciante', 'intermediario', 'avancado')),
    instrutor_id INTEGER REFERENCES instrutores(id_instrutor),
    ativo BOOLEAN DEFAULT TRUE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE grupos (
    id_group SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    id_instrutor INTEGER NOT NULL REFERENCES instrutores(id_instrutor),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE aluno_grupo (
    id_aluno INTEGER REFERENCES alunos(id_aluno),
    id_grupo INTEGER REFERENCES grupos(id_group),
    ativo BOOLEAN DEFAULT TRUE,
    data_entrada DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (id_aluno, id_grupo)
);

CREATE TABLE planos (
    id_plano SERIAL PRIMARY KEY,
    tipo_periodo VARCHAR(20) NOT NULL 
    CHECK (tipo_periodo IN ('mensal', 'trimestral', 'semestral')),
    tipo_acomp VARCHAR(20) NOT NULL 
    CHECK (tipo_acomp IN ('individual', 'grupo')),
    valor NUMERIC(8,2) NOT NULL CHECK (valor > 0),
    descricao TEXT,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE contratos (
    id_contrato SERIAL PRIMARY KEY,
    id_aluno INTEGER NOT NULL REFERENCES alunos(id_aluno),
    id_plano INTEGER NOT NULL REFERENCES planos(id_plano),
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    status VARCHAR(20) NOT NULL 
    CHECK (status IN ('ativo', 'encerrado', 'cancelado')),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cronogramas (
    id_cronograma SERIAL PRIMARY KEY,
    semana_ref DATE NOT NULL,
    meta_km NUMERIC(6,2) NOT NULL CHECK (meta_km >= 0),
    descricao TEXT,
    id_grupo INTEGER REFERENCES grupos(id_group),
    id_aluno INTEGER REFERENCES alunos(id_aluno),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_destinatario CHECK (id_grupo IS NOT NULL OR id_aluno IS NOT NULL)
);

CREATE TABLE treinos (
    id_treino SERIAL PRIMARY KEY,
    id_cronograma INTEGER NOT NULL REFERENCES cronogramas(id_cronograma),
    id_aluno INTEGER NOT NULL REFERENCES alunos(id_aluno),
    data DATE NOT NULL,
    distancia_km NUMERIC(6,2) NOT NULL CHECK (distancia_km >= 0),
    duracao_min INTEGER NOT NULL CHECK (duracao_min > 0),
    status VARCHAR(20) NOT NULL 
    CHECK (status IN ('pendente', 'concluido', 'cancelado')),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);