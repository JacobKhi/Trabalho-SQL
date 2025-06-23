# JJVGS - Jacob Jose Video Game Studios

**Minimundo**

JJVGS é uma empresa que atua no desenvolvimento, publicação e suporte de videogames. Cada jogo criado pela empresa passa por um processo estruturado, com equipes (compostas por programadores, artistas, designers e testadores) para transformar as ideias em experiências de jogo (game feeling), através de alguma engine.

O desenvolvimento de cada jogo segue um cronograma dividido em fases definidas, e cada etapa é registrada, desde a concepção inicial até os lançamentos e atualizações pós-lançamento. Os jogos são disponibilizados em plataformas, como: steam, epic games e aplicativos mobile (google play e app store).

Além de criar jogos, a JVGS também possui um FAQ e um suporte aos jogadores. Onde os usuários podem relatar problemas, sugerir melhorias ou tirar dúvidas. Esses chamados são analisados por uma equipe de suporte especializada, que encaminha para os desenvolvedores quando necessário, garantindo que a experiência dos jogadores continue sendo positiva.

**Modelo Lógico**

Engine(id, nome, versao, tipo_licenca, site_oficial)

Jogo(id, nome, genero, data_lancamento, estado, id_engine)

Plataforma(id, nome, tipo)

Jogo_Plataforma(id_jogo, id_plataforma, link_download)

Funcionario(id, nome, cargo, especialidade, salario)

Projeto(id, id_jogo, data_inicio, data_fim, estado)

Projeto_Equipe(id_projeto, id_funcionario, papel, data_entrada)

Atualizacao(id, id_jogo, versao, descricao, data)

Chamado_Suporte(id, id_jogo, titulo, descricao, prioridade, estado, data_abertura, id_funcionario_responsavel)

Relatorio_Bugs(id, id_chamado, id_funcionario_tester, descricao, estado)

Publicadora(id, nome, pais, contrato_inicio, contrato_fim)
