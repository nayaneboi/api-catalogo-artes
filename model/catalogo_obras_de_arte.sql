DROP DATABASE IF EXISTS catalogo_obras_de_arte;
CREATE DATABASE catalogo_obras_de_arte CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE catalogo_obras_de_arte;

CREATE TABLE artistas (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_falecimento DATE,
    status ENUM('on', 'del') DEFAULT 'on',
    PRIMARY KEY (id)
);

CREATE TABLE museus (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(255),
    pais VARCHAR(255) NOT NULL,
    status ENUM('on', 'del') DEFAULT 'on',
    PRIMARY KEY (id)
);

CREATE TABLE administrador (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    status ENUM('on', 'del') DEFAULT 'on',
    PRIMARY KEY (id)
);

CREATE TABLE movimento (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255),
    periodo VARCHAR(255),
    PRIMARY KEY (id)
);


CREATE TABLE obras (
    id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    tecnica VARCHAR(255),
    descricao VARCHAR(255),
    ano INT NOT NULL,
    imagem VARCHAR(255),
    artista_id INT NOT NULL,
    museu_id INT,
    movimento_id INT,
    status ENUM('on', 'del') DEFAULT 'on',
    PRIMARY KEY (id),
    FOREIGN KEY (artista_id) REFERENCES artistas(id),
    FOREIGN KEY (museu_id) REFERENCES museus(id),
    FOREIGN KEY (movimento_id) REFERENCES movimento(id)
);


INSERT INTO artistas (nome, nacionalidade, data_nascimento, data_falecimento)
VALUES
('Leonardo da Vinci', 'Italiano', '1452-04-15', '1519-05-02'),
('Vincent van Gogh', 'Holandês', '1853-03-30', '1890-07-29'),
('Pablo Picasso', 'Espanhol', '1881-10-25', '1973-04-08');

INSERT INTO museus (nome, cidade, estado, pais)
VALUES
('Museu do Louvre', 'Paris', NULL, 'França'),
('Museu Van Gogh', 'Amsterdã', NULL, 'Holanda'),
('Museo Nacional Centro de Arte Reina Sofía', 'Madri', NULL, 'Espanha');

INSERT INTO administrador (nome, email, senha)
VALUES
('Admin', 'admin@example.com', '123456');

INSERT INTO movimento (nome, periodo) 
VALUES
('Renascimento','séculos XIV e XVI'),
('Pós-impressionismo', 'século XIX e XX'),
('Cubismo', 'anos de 1907 e 1914');

INSERT INTO obras (titulo, tecnica, descricao, ano, imagem, artista_id, museu_id, movimento_id)
VALUES
('Mona Lisa', 'Óleo sobre madeira', 'Sobre a mona lisa', 1503, 'http://t1.gstatic.com/licensed-image?q=tbn:ANd9GcQ-FvbbAq5IaJUhtwxXEwY0D-jiZju02ejnNHx_bQWL_27GF3srhwJgqusMAqKh3QqU', 1, 1, 1),
('Noite Estrelada', 'Óleo sobre tela', 'Sobre a noite estrelada', 1889, 'https://arteeartistas.com.br/wp-content/uploads/2018/09/Noite-Estrelada.-Vincent-van-Gogh.jpg', 2, 2, 2),
('Guernica', 'Óleo sobre tela', 'Sobre o Guernica', 1937, 'https://ogimg.infoglobo.com.br/in/21279652-caf-4b0/FT1086A/guernica_picasso.jpg', 3, 3, 3);


-- Lista todos os registros válidos - GET TODOS
SELECT * FROM obras WHERE status = 'on' ORDER BY id DESC;

-- Lista um registro único pelo ID - GET DE UM
SELECT * FROM obras WHERE status = 'on' AND id = ?;

-- Lista todos os registros de obra de um artista - GET FILTRANDO O ARTISTA
SELECT * FROM obras WHERE status = 'on' AND artista_id = ?;

-- Lista todos os registros de obras de um museu - GET FILTRANDO O MUSEU
SELECT * FROM obras WHERE status = 'on' AND museus_id = ?;

-- Deleta uma obra pelo ID - DEL
UPDATE obras SET status = 'del' WHERE id = ?;

-- Insere um novo registro - POST
INSERT INTO obras (titulo, tecnica, descricao, ano, imagem, artista_id, museu_id) VALUES (?, ?, ?, ?, ?, ?, ?);

-- Edita uma obra - PUT
UPDATE obras SET titulo = ?, tecnica = ?, descricao = ?, ano = ?, imagem = ?, artista_id = ?, museu_id = ?;


-- Artistas

-- Lista todos - GET
SELECT * FROM artistas WHERE status = 'on' ORDER BY id DESC;

-- Lista pelo ID - GET
SELECT * FROM artistas WHERE status = 'on' AND id = ?;

-- Deleta um artista pelo ID - DEL
UPDATE artistas SET status = 'del' WHERE id = ?;

-- Insere um novo artista - POST
INSERT INTO artista (nome, nacionalidade, data_nascimento, data_falecimento) VALUES (?, ?, ?, ?);

-- Edita um artista - PUT
UPDATE artistas SET nome = ?, nacionalidade = ?, data_nascimento = ?, data_falecimento = ?;


-- Museus

-- Lista todos - GET
SELECT * FROM museus;

-- Lista pelo ID - GET
SELECT * FROM museus WHERE id = ?;



-- Administrador

-- Lista pelo ID - GET
SELECT * FROM administrador WHERE status = 'on' AND id = ?;

-- Login  POST
SELECT * FROM administrador WHERE status = 'on' AND email = ? AND senha = ?;





-- Obras
