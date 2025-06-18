/*
    zé esse codigo foi feito todo a mao entao pode ter alguns erros
    eu preciso que voce va vendo oq precisa ser alterado
    essa é so a parte ddl
*/
create database db_jjvgs
use db_jjvgs

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
    engine_id int,
    foreign key (engine_id) references engine(id),
    primary key (id)
);

create table plataforma(
    id int not null auto_increment,
    nome VARCHAR(100) not null,
    tipo ENUM('console', 'pc', 'mobile', 'web', 'cloud') not null, -- Acho que pode deixar como enum
    primary key (id)
);

create table jogo_plataforma(
    jogo_id int,
    plataforma_id int,
    link_dowload VARCHAR(255),
    foreign key (jogo_id) references jogo(id),
    foreign key (plataforma_id) references plataforma(id),
    primary key (jogo_id, plataforma_id)
);

create table funcionario(
    id int not null auto_increment,
    nome VARCHAR(100) not null,
    cargo ENUM('dev', 'designer', 'tester', 'produtor', 'gerente') not null, -- Acho que pode deixar como enum
    especialidade VARCHAR(255), -- Deixar como varchar mesmo?
    salario decimal(10, 2) not null,
    primary key (id)
);

create table projeto(
    id int no null auto_increment,
    jogo_id int,
    data_inicio date not null,
    data_fim date, -- Não achei necessário ser obrigatório
    estado ENUM('ativo', 'pausado', 'concluido') not null,
    foreign key (jogo_id) references jogo(id),
    primary key (id)
);

create table projeto_equipe(
    projeto_id int,
    funcionario_id int,
    papel VARCHAR(50), -- Rever isso, colocar um enum talvez??
    data_entrada date not null,
    foreign key (projeto_id) references projeto(id),
    foreign key (funcionario_id) references funcionario(id),
    primary key (projeto_id, funcionario_id)
);

create table atualizacao(
    id int no null auto_increment,
    jogo_id int,
    versao VARCHAR(50), -- Nao sei oq fazer aqui, pois o jogo ja tem uma versao, entao poderiamos atualizar sla
    descricao VARCHAR(255),
    data_atualizacao date,\
    foreign key (jogo_id) references jogo(id),
    primary key (id)
);

create table chamado_suporte(
    id int not null auto_increment,
    jogo_id int,
    funcionario_responsavel_id int,
    titulo VARCHAR(100) not null,
    descricao VARCHAR(255),
    prioridade ENUM('baixa', 'media', 'alta', 'critica') not null,
    estado ENUM('aberto', 'em andamento', 'resolvido', 'fechado') not null,
    data_abertura date not null,
    foreign key (jogo_id) references jogo(id),
    foreign key (funcionario_responsavel_id) references funcionario(id),
    primary key (id)
);

create table relatorio_bugs(
    id int not null auto_increment,
    chamado_suporte_id int,
    funcionario_tester_id int,
    descricao VARCHAR(255),
    estado ENUM('novo', 'em análise', 'corrigido', 'ignorado') not null,
    foreign key (chamado_suporte_id) references chamado_suporte(id),
    foreign key (funcionario_tester_id) references funcionario(id),
    primary key (id)
);

-- Rever o que precisa ser obrigatorio
create table publicadora( 
    id int not null auto_increment,
    nome VARCHAR(100),  
    pais VARCHAR(50),
    contrato_inicio date,
    contrato_fim date,
    primary key (id)
);