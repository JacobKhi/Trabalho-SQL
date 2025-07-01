# JJVGS - Jacob Jose Video Game Studios

**Minimundo**

JJVGS é uma empresa que atua no desenvolvimento, publicação e suporte de videogames. Cada jogo criado pela empresa passa por um processo estruturado, com equipes (compostas por programadores, artistas, designers e testadores) para transformar as ideias em experiências de jogo (game feeling), através de alguma engine.

O desenvolvimento de cada jogo segue um cronograma dividido em fases definidas, e cada etapa é registrada, desde a concepção inicial até os lançamentos e atualizações pós-lançamento. Os jogos são disponibilizados em plataformas, como: steam, epic games e aplicativos mobile (google play e app store).

Além de criar jogos, a JVGS também possui um FAQ e um suporte aos jogadores. Onde os usuários podem relatar problemas, sugerir melhorias ou tirar dúvidas. Esses chamados são analisados por uma equipe de suporte especializada, que encaminha para os desenvolvedores quando necessário, garantindo que a experiência dos jogadores continue sendo positiva.

**Modelo Lógico**

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
