-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS oficina;
USE oficina;

-- Tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    cidade VARCHAR(50)
);

-- Tabela Veículos
CREATE TABLE Veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    ano INT,
    placa VARCHAR(10),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabela Funcionários
CREATE TABLE Funcionarios (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

-- Tabela Serviços
CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    id_veiculo INT NOT NULL,
    id_funcionario INT NOT NULL,
    descricao VARCHAR(255),
    data_servico DATE,
    valor DECIMAL(10,2),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario)
);

-- Inserir dados de exemplo
INSERT INTO Clientes (nome, telefone, email, cidade) VALUES
('João Silva', '1111-2222', 'joao@email.com', 'São Paulo'),
('Maria Souza', '3333-4444', 'maria@email.com', 'Rio de Janeiro');

INSERT INTO Veiculos (id_cliente, modelo, marca, ano, placa) VALUES
(1, 'Civic', 'Honda', 2019, 'ABC-1234'),
(2, 'Corolla', 'Toyota', 2020, 'XYZ-5678');

INSERT INTO Funcionarios (nome, cargo, salario) VALUES
('Carlos Pereira', 'Mecânico', 3000.00),
('Ana Lima', 'Atendente', 2000.00);

INSERT INTO Servicos (id_veiculo, id_funcionario, descricao, data_servico, valor) VALUES
(1, 1, 'Troca de óleo', '2026-01-05', 150.00),
(2, 2, 'Alinhamento', '2026-01-06', 100.00);
