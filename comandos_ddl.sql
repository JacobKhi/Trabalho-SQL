-- COMANDOS DDL

create database if not exists db_jjvgs;

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
    genero VARCHAR(255) not null,
    data_lancamento date,
    estado ENUM('planejado', 'em_desenvolvimento', 'lancado', 'cancelado') not null,
    engine_id int not null,
    publicadora_id int not null,
    foreign key (publicadora_id) references publicadora(id) 
        on delete restrict
        on update cascade,
    foreign key (engine_id) references engine(id) 
        on delete restrict
        on update cascade,
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
    foreign key (jogo_id) references jogo(id) 
        on delete cascade,
    foreign key (plataforma_id) references plataforma(id) 
         on delete cascade,
    primary key (jogo_id, plataforma_id)
);

create table funcionario(
    id int not null auto_increment,
    nome VARCHAR(100) not null,
    cargo ENUM('dev', 'designer', 'tester', 'produtor', 'gerente') not null,
    especialidade VARCHAR(255),
    salario decimal(10, 2) not null check (salario >= 0),
    primary key (id)
);

create table projeto(
    id int not null auto_increment,
    jogo_id int not null,
    data_inicio date not null,
    data_fim date,
    estado ENUM('ativo', 'pausado', 'concluido') not null,
    foreign key (jogo_id) references jogo(id) 
        on delete cascade,
    primary key (id)
);

create table projeto_equipe(
    projeto_id int not null,
    funcionario_id int not null,
    papel VARCHAR(50),
    data_entrada date not null,
    foreign key (projeto_id) references projeto(id) 
        on delete cascade,
    foreign key (funcionario_id) references funcionario(id) 
        on delete cascade,
    primary key (projeto_id, funcionario_id)
);

create table atualizacao(
    id int not null auto_increment,
    jogo_id int not null,
    versao VARCHAR(50) not null,
    descricao text,
    data_atualizacao date not null,
    foreign key (jogo_id) references jogo(id) 
        on delete cascade 
        on update cascade,
    primary key (id)
);

create table chamado_suporte(
    id int not null auto_increment,
    jogo_id int not null,
    funcionario_responsavel_id int,
    titulo VARCHAR(100) not null,
    descricao text,
    prioridade ENUM('baixa', 'media', 'alta', 'critica') not null,
    estado ENUM('aberto', 'em_andamento', 'resolvido', 'fechado') not null,
    data_abertura datetime not null default current_timestamp,
    foreign key (jogo_id) references jogo(id) 
        on delete cascade,
    foreign key (funcionario_responsavel_id) references funcionario(id) 
        on delete set null,
    primary key (id)
);

create table relatorio_bugs(
    id int not null auto_increment,
    chamado_suporte_id int not null,
    funcionario_tester_id int not null,
    descricao text,
    estado ENUM('novo', 'em_analise', 'corrigido', 'ignorado') not null,
    foreign key (chamado_suporte_id) references chamado_suporte(id) 
        on delete cascade,
    foreign key (funcionario_tester_id) references funcionario(id) 
        on delete restrict,
    primary key (id)
);