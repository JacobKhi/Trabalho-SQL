# JJVGS - Jacob Jose Video Game Studios

**Minimundo**

JJVGS (Jacob Jose Video Game Studios)
A empresa JJVGS (Jacob Jose Video Game Studios) atua nas áreas de desenvolvimento, publicação e suporte de videogames. Para organizar suas operações e garantir a rastreabilidade dos processos, foi elaborado um sistema de banco de dados que modela as principais entidades envolvidas no ciclo de vida de um jogo, desde a concepção até o suporte pós-lançamento.
Jogos
Cada jogo possui informações como nome, gênero, data de lançamento e estado atual, que pode ser planejado, em desenvolvimento, lançado ou cancelado. Os jogos são desenvolvidos utilizando uma engine específica e são publicados por uma publicadora. Além disso, podem ser disponibilizados em múltiplas plataformas, com o respectivo link de download.
Engine
As engines são ferramentas utilizadas para o desenvolvimento dos jogos. Cada engine cadastrada possui um nome, versão, tipo de licença e site oficial.
Publicadora
As publicadoras são responsáveis pela distribuição dos jogos. Para cada publicadora, são armazenados dados como nome, país de origem, e as datas de início e término de contrato com a JJVGS.
Plataforma
As plataformas representam os meios pelos quais os jogos são distribuídos aos usuários. São classificadas por nome e tipo (como console, PC, mobile, web ou cloud). Cada jogo pode estar associado a uma ou mais plataformas.
Funcionário
A empresa mantém um registro de seus funcionários, contendo nome, cargo (como desenvolvedor, designer, tester, produtor ou gerente), especialidade e salário. Esses profissionais são alocados em projetos conforme suas habilidades.
Projeto
Cada jogo possui um ou mais projetos vinculados ao seu desenvolvimento. Esses projetos incluem a data de início, data de término e o estado atual do projeto (ativo, pausado ou concluído).
Projeto_Equipe
O relacionamento entre projetos e funcionários é armazenado em uma entidade que representa a equipe do projeto. Nessa tabela são registrados o papel exercido pelo funcionário no projeto (programador líder ou tester QA) e a data de entrada no projeto.
Atualização
Após o lançamento, os jogos podem receber atualizações que corrigem problemas ou introduzem melhorias. Cada atualização possui uma versão, descrição e data de aplicação.
Chamado de Suporte
Os jogadores podem entrar em contato com a JJVGS por meio de chamados de suporte. Cada chamado está vinculado a um jogo e a um funcionário responsável pelo atendimento. São registrados dados como título, descrição, prioridade (baixa, média, alta ou crítica), estado (aberto, em andamento, resolvido ou fechado) e a data de abertura.
Relatório de Bugs
Os testers da equipe de desenvolvimento podem registrar relatórios com base nos chamados recebidos. Cada relatório é vinculado a um chamado e ao funcionário que o analisou. As informações armazenadas incluem a descrição do problema e o estado atual do relatório (novo, em análise, corrigido ou ignorado).

Finalidade do Sistema
O sistema foi projetado para dar suporte completo ao processo de criação, manutenção e distribuição de jogos na JJVGS. Ele permite o controle detalhado de projetos, equipes, plataformas, atualizações e suporte técnico, promovendo uma gestão eficiente das atividades e uma experiência satisfatória para os usuários finais.


**Modelo Lógico**

![DiagramaDoBancoDeDados](https://github.com/user-attachments/assets/2a145eeb-8487-4fcf-8890-bbd4849fa158)

Publicadora(id (PK), nome, pais, contrato_inicio, contrato_fim)

Engine(id (PK), nome, versao, tipo_licenca, site_oficial)

Funcionario(id (PK), nome, cargo, especialidade, salario)

Plataforma(id (PK), nome, tipo)

Jogo(id (PK), nome, genero, data_lancamento, estado, engine_id (FK), publicadora_id (FK))

Projeto(id (PK), jogo_id (FK), data_inicio, data_fim, estado)

Atualizacao(id (PK), jogo_id (FK), versao, descricao, data_atualizacao)
Chamado_Suporte(id (PK), jogo_id (FK), funcionario_responsavel_id (FK), titulo, descricao, prioridade, estado, data_abertura)

Relatorio_Bugs(id (PK), chamado_suporte_id (FK), funcionario_tester_id (FK), descricao, estado)

Jogo_Plataforma(jogo_id (PK, FK), plataforma_id (PK, FK), link_download)

Projeto_Equipe(projeto_id (PK, FK), funcionario_id (PK, FK), papel, data_entrada)

