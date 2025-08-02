# JJVGS - Jacob Jose Video Game Studios

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)

Um sistema de banco de dados relacional projetado para gerenciar o ciclo de vida completo de desenvolvimento e suporte de jogos eletrônicos.

---

## Sobre o Projeto

A JJVGS (Jacob Jose Video Game Studios) é uma empresa fictícia que atua no desenvolvimento, publicação e suporte de videogames. Para gerenciar a complexidade de suas operações, este projeto implementa um banco de dados robusto que centraliza e organiza todas as informações cruciais, desde a concepção de um jogo até o suporte pós-lançamento.

O sistema foi projetado para garantir a rastreabilidade dos processos, otimizar a alocação de recursos e fornecer uma base sólida para a tomada de decisões estratégicas.

## Funcionalidades Principais

* **Gestão de Catálogo de Jogos:** Cadastro detalhado de jogos, incluindo gênero, estado (planejado, em desenvolvimento, etc.), engines e publicadoras.
* **Controle de Plataformas:** Gerenciamento de múltiplas plataformas (console, PC, mobile) e associação de jogos a cada uma, com seus respectivos links de download.
* **Gerenciamento de Projetos e Equipes:** Alocação de funcionários em projetos específicos, com definição de papéis e acompanhamento do estado de cada projeto (ativo, pausado, concluído).
* **Ciclo de Vida Pós-Lançamento:** Sistema para registro de atualizações e patches de versão para cada jogo.
* **Sistema de Suporte Técnico:** Abertura e acompanhamento de chamados de suporte, com classificação de prioridade, atribuição de responsáveis e controle de estado.
* **Análise e Relatório de Bugs:** Ferramenta para que a equipe de QA registre e gerencie relatórios de bugs detalhados, vinculados diretamente aos chamados de suporte dos usuários.

## Estrutura do Banco de Dados

A arquitetura do banco de dados foi modelada para refletir as relações complexas entre as diferentes entidades do negócio.

### Modelo Lógico
![Diagrama do Banco de Dados](https://github.com/user-attachments/assets/2a145eeb-8487-4fcf-8890-bbd4849fa158)

### Tabelas Principais
* **`jogo`**: Tabela central que armazena todos os jogos do estúdio.
* **`publicadora`**, **`engine`**, **`plataforma`**: Tabelas de cadastro para as entidades externas relacionadas aos jogos.
* **`funcionario`**: Registro de todos os colaboradores da JJVGS.
* **`projeto`**, **`projeto_equipe`**: Estruturas que definem os projetos de desenvolvimento e as equipes alocadas.
* **`atualizacao`**: Histórico de versões e patches lançados para os jogos.
* **`chamado_suporte`**, **`relatorio_bugs`**: Tabelas que formam o sistema de suporte e controle de qualidade.

## Como Utilizar

Para recriar este banco de dados em seu ambiente local, siga os passos abaixo:

1.  **Clone o Repositório**
    ```bash
    git clone https://github.com/JacobKhi/Trabalho-SQL
    ```

2.  **Execute os Scripts SQL**
    Conecte-se ao seu servidor MySQL e execute os scripts na seguinte ordem para garantir a correta criação das tabelas e a inserção dos dados:

    ```sql
    -- 1. Cria a estrutura do banco de dados e todas as tabelas.
    SOURCE caminho/para/comandos_ddl.sql;

    -- 2. Popula as tabelas com os dados iniciais.
    SOURCE caminho/para/comandos_dml.sql;

    -- 3. Executa atualizações em massa para simular evoluções nos dados.
    SOURCE caminho/para/comandos_dml_update.sql;
    ```

## Exemplos de Relatórios

O arquivo `comandos_dml_relatorios.sql` contém diversas consultas `SELECT` para extrair insights valiosos do banco de dados.

**Exemplo: Listar todos os funcionários em projetos ativos**
```sql
select
    f.nome as nome_do_funcionario,
    f.cargo,
    j.nome as trabalhando_no_jogo,
    pe.papel as papel_no_projeto
from
    funcionario f
inner join
    projeto_equipe pe on f.id = pe.funcionario_id
inner join
    projeto p on pe.projeto_id = p.id
inner join
    jogo j on p.jogo_id = j.id
where
    p.estado = 'ativo'
order by
    f.nome;
