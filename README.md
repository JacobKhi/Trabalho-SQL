# JJVGS (Jacob Jose Video Game Studios) - Sistema de Banco de Dados

**Minimundo**

## Sobre o Sistema

A empresa **JJVGS (Jacob Jose Video Game Studios)** atua nas áreas de desenvolvimento, publicação e suporte de videogames. Para organizar suas operações e garantir a rastreabilidade dos processos, foi elaborado um sistema de banco de dados que modela as principais entidades envolvidas no ciclo de vida de um jogo, desde a concepção até o suporte pós-lançamento.

---

## Entidades do Banco de Dados

### Jogos
Cada jogo possui informações como:
* **Nome**
* **Gênero**
* **Data de lançamento**
* **Estado atual:** `planejado`, `em desenvolvimento`, `lançado` ou `cancelado`.

Os jogos são desenvolvidos utilizando uma **engine** específica e são publicados por uma **publicadora**. Além disso, podem ser disponibilizados em múltiplas **plataformas**, com o respectivo link de download.

### Engine
As engines são ferramentas utilizadas para o desenvolvimento dos jogos. Cada engine cadastrada possui:
* **Nome**
* **Versão**
* **Tipo de licença**
* **Site oficial**

### Publicadora
As publicadoras são responsáveis pela distribuição dos jogos. Para cada publicadora, são armazenados dados como:
* **Nome**
* **País de origem**
* **Data de início de contrato** com a JJVGS
* **Data de término de contrato** com a JJVGS

### Plataforma
As plataformas representam os meios pelos quais os jogos são distribuídos aos usuários. São classificadas por:
* **Nome**
* **Tipo:** `console`, `PC`, `mobile`, `web` ou `cloud`.

Cada jogo pode estar associado a uma ou mais plataformas.

### Funcionário
A empresa mantém um registro de seus funcionários, contendo:
* **Nome**
* **Cargo:** `desenvolvedor`, `designer`, `tester`, `produtor` ou `gerente`.
* **Especialidade**
* **Salário**

Esses profissionais são alocados em projetos conforme suas habilidades.

### Projeto
Cada jogo possui um ou mais projetos vinculados ao seu desenvolvimento. Esses projetos incluem:
* **Data de início**
* **Data de término**
* **Estado atual do projeto:** `ativo`, `pausado` ou `concluído`.

### Projeto_Equipe
O relacionamento entre projetos e funcionários é armazenado em uma entidade que representa a equipe do projeto. Nessa tabela são registrados:
* O **papel exercido pelo funcionário** no projeto (ex: `programador líder`, `tester QA`).
* A **data de entrada** do funcionário no projeto.

### Atualização
Após o lançamento, os jogos podem receber atual


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

