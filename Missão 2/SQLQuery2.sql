-- Criação do Banco de Dados
CREATE DATABASE loja;
GO

USE loja;
GO

-- Tabela Usuários
CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY,
    Nome TEXT
    Senha BIGINT(255),
    Papel VARCHAR(50)
);

-- Tabela Pessoas
CREATE TABLE Pessoas (
    ID_Pessoa INT PRIMARY KEY,
    Nome VARCHAR(255),
    Logradouro VARCHAR(225),
    Cidade VARCHAR(100),
    Estado VARCHAR(2),
    Telefone VARCHAR(100),
    Email VARCHAR(255)
);

-- Tabela Produtos
CREATE TABLE Produtos (
    ID_Produto INT PRIMARY KEY,
    Nome TEXT,
    Quantidade INT,
    Preco_Venda DECIMAL(10, 2)
);

-- Tabela Movimentos
CREATE TABLE Movimentos (
    ID_Movimento INT PRIMARY KEY,
    ID_Usuario INT,
    ID_Pessoa INT,
    ID_Produto INT,
    Tipo_Movimento NVARCHAR(20),
    Quantidade INT,
    Preco_Unitario DECIMAL(10, 2),
    Data_Movimento DATETIME,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoas(ID_Pessoa),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID_Produto)
);

-- Tabela PessoaFisica
CREATE TABLE PessoaFisica (
    ID_Pessoa INT PRIMARY KEY,
    CPF CHAR(11) UNIQUE,
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoas(ID_Pessoa)
);

-- Tabela PessoaJuridica
CREATE TABLE PessoaJuridica (
    ID_Pessoa INT PRIMARY KEY,
    CNPJ CHAR(14) UNIQUE,
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoas(ID_Pessoa)
);

-- Sequence para ID_Pessoa
CREATE SEQUENCE Seq_ID_Pessoa START WITH 1 INCREMENT BY 1;
