CREATE TABLE compromissos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    hora_inicio TIME,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO compromissos (titulo, descricao, data_inicio, hora_inicio)
VALUES 
('Consulta Médica', 'Clínica geral', '2025-05-08', '09:00'),
('Reunião Equipe', 'Planejamento semanal', '2025-05-07', '14:30'),
('Dentista', 'Limpeza e revisão', '2025-05-10', '11:00'),
('Churrasco com Amigos', 'Casa do João', '2025-05-11', '18:00'),
('Aula de Inglês', 'Aula online via Zoom', '2025-05-07', '19:00');

-- Listar todos os compromissos com data posterior à data atual.
SELECT *
FROM compromissos
WHERE data_inicio > DATE('now');

-- Exibir os compromissos marcados exatamente para o dia de hoje.
SELECT *
FROM compromissos
WHERE data_inicio = DATE('now');

-- Listar os compromissos do dia atual ordenados pela hora de início.
SELECT *
FROM compromissos
WHERE data_inicio = DATE('now')
ORDER BY hora_inicio ASC;

-- Listar os compromissos agendados para os próximos 3 dias.
SELECT *
FROM compromissos
WHERE data_inicio BETWEEN DATE('now') AND DATE('now', '+3 days');

-- Exibir os compromissos que foram criados nas últimas 24 horas.
SELECT *
FROM compromissos
WHERE criado_em >= DATETIME('now', '-1 day');

-- Inserir um novo compromisso com a data e hora atuais.
INSERT INTO compromissos (id, titulo, descricao, data_inicio, hora_inicio, criado_em)
VALUES
('Novo compromisso', 'Teste', '2025-06-01', '10:00', CURRENT_TIMESTAMP);

-- Listar todos os compromissos e mostrar, para cada um, quantos dias faltam até a data de início.
SELECT id, data_inicio, CEIL(JULIANDAY(data_inicio) - JULIANDAY('now')) AS dias_restantes
FROM compromissos;

-- Selecionar os compromissos que acontecerão em finais de semana (sábado ou domingo).
SELECT id, data_inicio
FROM compromissos
WHERE STRFTIME('%w', data_inicio) IN ('0', '6');

-- Mostrar os compromissos que aconteceram há mais de 7 dias a partir da data atual.
SELECT id, data_inicio
FROM compromissos
WHERE data_inicio <= DATE('now', '-7 days');


-- Exibir o horário atual do sistema.
SELECT CURRENT_TIMESTAMP;

-- Selecionar compromissos cuja hora de início seja anterior a 12:00.
SELECT *
FROM compromissos
WHERE hora_inicio <= '12:00';

-- Listar os compromissos com mais de uma semana de antecedência em relação à data atual.
SELECT *
FROM compromissos
WHERE data_inicio > DATE('now', '+7 days');

-- Exibir apenas os títulos e a diferença em horas entre o momento atual e a hora de início do compromisso (considere o mesmo dia para simplificar).
SELECT titulo, hora_inicio, hora_inicio - TIME('now') AS diferenca_de_horas
FROM compromissos;

-- atualizar a descrição de um compromisso para 'reagendado' apenas se a data_inicio for posterior à data atual.
UPDATE compromissos
SET descricao = 'Reagendado'
WHERE data_inicio > DATE('now');

-- Excluir compromissos com data anterior a 30 dias atrás.
DELETE FROM compromissos
WHERE data_inicio < DATE('now', '-30 days');

