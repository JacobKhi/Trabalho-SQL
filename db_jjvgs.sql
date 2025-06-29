-- COMANDOS DDL
create database if not exists db_jjvgs
use db_jjvgs

create table publicadora( 
    id int not null auto_increment,
    nome VARCHAR(100) not null,  
    pais VARCHAR(50),
    contrato_inicio date,
    contrato_fim date,
    primary key (id)
);

create table engine(
    id int not null auto_increment,
    nome VARCHAR(100) not null,
    versao VARCHAR(50) not null,
    tipo_licenca VARCHAR(50),
    site_oficial VARCHAR(255),
    primary key (id)
);

create table jogo(
    id int not null auto_increment,
    nome VARCHAR(100) not null,
    genero VARCHAR(255) not null, -- Genero pode ser livre?
    data_lancamento date,
    estado ENUM('planejado', 'em_desenvolvimento', 'lancado', 'cancelado') not null,
    engine_id int not null,
    publicadora_id int not null,
    foreign key (publicadora_id) references publicadora(id),
    foreign key (engine_id) references engine(id),
    primary key (id)
);

create table plataforma(
    id int not null auto_increment,
    nome VARCHAR(100) not null,
    tipo ENUM('console', 'pc', 'mobile', 'web', 'cloud') not null,
    primary key (id)
);

create table jogo_plataforma(
    jogo_id int not null,
    plataforma_id int not null,
    link_download VARCHAR(255),
    foreign key (jogo_id) references jogo(id),
    foreign key (plataforma_id) references plataforma(id),
    primary key (jogo_id, plataforma_id)
);

create table funcionario(
    id int not null auto_increment,
    nome VARCHAR(100) not null,
    cargo ENUM('dev', 'designer', 'tester', 'produtor', 'gerente') not null,
    especialidade VARCHAR(255), -- Deixar como varchar mesmo?
    salario decimal(10, 2) not null check (salario >= 0),
    primary key (id)
);

create table projeto(
    id int not null auto_increment,
    jogo_id int not null,
    data_inicio date not null,
    data_fim date,
    estado ENUM('ativo', 'pausado', 'concluido') not null,
    foreign key (jogo_id) references jogo(id),
    primary key (id)
);

create table projeto_equipe(
    projeto_id int not null,
    funcionario_id int not null,
    papel VARCHAR(50), -- Rever isso, colocar um enum talvez??
    data_entrada date not null,
    foreign key (projeto_id) references projeto(id),
    foreign key (funcionario_id) references funcionario(id),
    primary key (projeto_id, funcionario_id)
);

create table atualizacao(
    id int not null auto_increment,
    jogo_id int not null,
    versao VARCHAR(50) not null,
    descricao text,
    data_atualizacao date not null,
    foreign key (jogo_id) references jogo(id),
    primary key (id)
);

create table chamado_suporte(
    id int not null auto_increment,
    jogo_id int not null,
    funcionario_responsavel_id int not null,
    titulo VARCHAR(100) not null,
    descricao text,
    prioridade ENUM('baixa', 'media', 'alta', 'critica') not null,
    estado ENUM('aberto', 'em_andamento', 'resolvido', 'fechado') not null,
    data_abertura datetime not null default current_timestamp,
    foreign key (jogo_id) references jogo(id),
    foreign key (funcionario_responsavel_id) references funcionario(id),
    primary key (id)
);

create table relatorio_bugs(
    id int not null auto_increment,
    chamado_suporte_id int not null,
    funcionario_tester_id int not null,
    descricao text,
    estado ENUM('novo', 'em_analise', 'corrigido', 'ignorado') not null,
    foreign key (chamado_suporte_id) references chamado_suporte(id),
    foreign key (funcionario_tester_id) references funcionario(id),
    primary key (id)
);

-- COMANDOS DML

insert into publicadora (nome, pais, contrato_inicio, contrato_fim) values
('Rockstar Games', 'EUA', '2023-03-01', '2025-03-01'),
('JJVGS', 'Brasil', null, null),
('CD Projekt Red', 'Polônia', null, null);

insert into engine (nome, versao, tipo_licenca, site_oficial) values
('Unity', '2021.3', 'proprietária', 'https://unity.com'),
('Unreal Engine', '5.6', 'gratuita', 'https://www.unrealengine.com/pt-BR'),
('Godot', '4.4.1', 'open source', 'https://godotengine.org');

insert into jogo (nome, genero, data_lancamento, estado, engine_id, publicadora_id) values
('CyberBunker2077', 'Sobrevivencia', '2024-10-01', 'lancado', 1, 3),      -- Jogo de sobrevivência em um servidor offline num porão ultra-seguro.
('Red Debit Deduction', 'Velho-oeste', null, 'em_desenvolvimento', 2, 1), -- A saga do cowboy que tenta fugir das dívidas do cartão.
('Fiscal Fantasy', 'RPG', '2023-07-20', 'lancado', 3, 2);                 -- Um RPG onde o herói tenta ajustar o orçamento público sem virar vilão.

insert into plataforma (nome, tipo) values
('PlayStation 5', 'console'),
('Steam', 'pc'),
('Android', 'mobile'),
('WebGL', 'web');

insert into jogo_plataforma (jogo_id, plataforma_id, link_dowload) values
(1, 2, 'https://store.steampowered.com/app/123456'),
(2, 1, null),
(3, 3, 'https://play.google.com/store/apps/details?id=fiscal.fantasy');

insert into funcionario (nome, cargo, especialidade, salario) values
('Gustavo Jacob', 'dev', 'Gameplay', 7000.00),
('Leonardo Barreto', 'designer', 'Interface', 6500.00),
('Jorge Pozes', 'tester', 'Automatizado', 5000.00),
('Marcos Gabriel', 'produtor', null, 9000.00),
('Jose Guilherme', 'gerente', null, 12000.00);

insert into projeto (jogo_id, data_inicio, data_fim, estado) values
(1, '2023-01-01', '2024-08-01', 'concluido'),
(2, '2024-05-10', null, 'ativo');

insert into projeto_equipe (projeto_id, funcionario_id, papel, data_entrada) values
(1, 1, 'Programador Líder', '2023-01-01'),
(1, 2, 'Designer UI', '2023-01-05'),
(2, 3, 'Tester QA', '2024-05-15');

insert into atualizacao (jogo_id, versao, descricao, data_atualizacao) values
(1, '1.1.0', 'Melhoria de desempenho', '2024-12-01'),
(3, '1.0.2', 'Correção de bugs gráficos', '2023-09-10');

insert into chamado_suporte (jogo_id, funcionario_responsavel_id, titulo, descricao, prioridade, estado, data_abertura) VALUES
(1, 3, 'Bug no menu principal', 'Menu congela ao clicar em "Iniciar"', 'alta', 'aberto');

insert into relatorio_bugs (chamado_suporte_id, funcionario_tester_id, descricao, estado) values
(1, 3, 'Bug reproduzido ao clicar rápido 3x', 'em_analise');

-- Segunda parte dos comando DML

/*
politica de reajuste salarial (só se aplica a funcionários que ganham menos de R$ 10.000)

desenvolvedores: receberão um aumento de 10%
designers e testers: receberão um aumento de 8%
outros cargos: receberão um aumento padrão de 5%
*/

update funcionario
set 
    salario = case 
        when cargo = 'dev' then salario * 1.10
        when cargo in ('designer', 'tester') then salario * 1.08
        else salario * 1.05
    end
where 
    salario < 10000.00;

/*
limpeza automática do status dos jogos

se um jogo já foi lançado mas seu status ainda esta como 'em_desenvolvimento',
o sistema deve corrigir para 'lancado'
*/

update jogo
set 
    estado = 'lancado'
where 
    data_lancamento <= CURDATE() 
    and estado = 'em_desenvolvimento';