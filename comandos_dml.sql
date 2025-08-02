-- COMANDOS DML

insert into publicadora (nome, pais, contrato_inicio, contrato_fim) values
('Rockstar Games', 'EUA', '2023-03-01', '2025-03-01'),
('JJVGS', 'Brasil', '2023-01-01', '2023-03-01'),
('CD Projekt Red', 'Polonia', null, null),
('DevsDoBrasil', 'Brasil', '2022-06-01', '2026-06-01'),
('IndieForge', 'EUA', '2021-11-15', null),
('Quantum Leap', 'Brasil', '2020-02-01', '2024-02-01'),
('Ubisoft', 'França', '2019-01-01', '2029-01-01');

insert into engine (nome, versao, tipo_licenca, site_oficial) values
('Unity', '2021.3', 'proprietária', 'https://unity.com'),
('Unreal Engine', '5.6', 'gratuita', 'https://www.unrealengine.com/pt-BR'),
('Godot', '4.4.1', 'open source', 'https://godotengine.org'),
('CryEngine', '5.7', 'proprietária', 'https://www.cryengine.com/'),
('RAGE', '9.0', 'proprietária', 'https://www.rockstargames.com/'),
('REDengine', '4.0', 'proprietária', 'https://www.cdprojektred.com/');

insert into jogo (nome, genero, data_lancamento, estado, engine_id, publicadora_id) values
('CyberBunker2077', 'Sobrevivencia', '2024-10-01', 'lancado', 1, 3),
('Red Debit Deduction', 'Velho-oeste', null, 'em_desenvolvimento', 2, 1),
('Fiscal Fantasy', 'RPG', '2023-07-20', 'lancado', 3, 2),
('Gala-Z', 'Aventura Espacial', '2025-01-15', 'lancado', 1, 4),
('Chronoscape', 'Puzzle', null, 'em_desenvolvimento', 4, 1),
('Project Nebula', 'Estratégia 4X', null, 'planejado', 2, 3),
('O Sertão de Aço', 'RPG de Turnos', '2024-08-30', 'lancado', 3, 4),
('Quantum Rift', 'Corrida', '2023-11-20', 'lancado', 2, 6),
('Pixel Odyssey', 'Plataforma', '2022-09-01', 'lancado', 3, 5),
('Voidfall', 'Ação', null, 'cancelado', 1, 5);

insert into plataforma (nome, tipo) values
('PlayStation 5', 'console'),
('Steam', 'pc'),
('Android', 'mobile'),
('WebGL', 'web'),
('Xbox Series X', 'console'),
('Nintendo Switch', 'console'),
('iOS', 'mobile'),
('Epic Games Store', 'pc');

insert into jogo_plataforma (jogo_id, plataforma_id, link_download) values
(1, 2, 'https://store.steampowered.com/app/123456'),
(2, 1, null),
(3, 3, 'https://play.google.com/store/apps/details?id=fiscal.fantasy'),
(1, 8, 'https://store.epicgames.com/p/cyberbunker2077'),
(4, 2, 'https://store.steampowered.com/app/789012'),
(4, 6, null),
(7, 1, null),
(7, 5, null),
(8, 2, 'https://store.steampowered.com/app/345678'),
(9, 2, 'https://store.steampowered.com/app/901234');

insert into funcionario (nome, cargo, especialidade, salario) values
('Gustavo Jacob', 'dev', 'Gameplay', 7000.00),
('Leonardo Barreto', 'designer', 'Interface', 6500.00),
('Jorge Pozes', 'tester', 'Automatizado', 5000.00),
('Marcos Gabriel', 'produtor', null, 9000.00),
('Jose Guilherme', 'gerente', null, 12000.00),
('Ana Leticia', 'dev', 'Back-end', 8500.00),
('Bruno Wagner', 'designer', 'Level Design', 6800.00),
('Luis Fernando', 'tester', 'Segurança', 5500.00),
('Kaue Barcelos', 'dev', 'IA', 8200.00),
('Talys Costa', 'produtor', 'Monetização', 9500.00);

insert into projeto (jogo_id, data_inicio, data_fim, estado) values
(1, '2023-01-01', '2024-08-01', 'concluido'),
(2, '2024-05-10', null, 'ativo'),
(3, '2022-01-15', '2023-07-10', 'concluido'),
(4, '2023-02-01', '2024-12-20', 'concluido'),
(5, '2025-02-01', null, 'ativo'),
(7, '2023-03-01', '2024-08-25', 'concluido'),
(8, '2022-05-20', '2023-11-15', 'concluido');

insert into projeto_equipe (projeto_id, funcionario_id, papel, data_entrada) values
(1, 1, 'Programador Líder', '2023-01-01'),
(1, 2, 'Designer UI', '2023-01-05'),
(2, 3, 'Tester QA', '2024-05-15'),
(2, 6, 'Programador de IA', '2024-06-01'),
(5, 7, 'Level Designer', '2025-02-10'),
(5, 9, 'Programador Gameplay', '2025-03-01'),
(4, 1, 'Programador Gameplay', '2023-02-15'),
(4, 8, 'Tester de Segurança', '2023-03-20'),
(7, 6, 'Programador de IA', '2023-04-01');

insert into atualizacao (jogo_id, versao, descricao, data_atualizacao) values
(1, '1.1.0', 'Melhoria de desempenho', '2024-12-01'),
(3, '1.0.2', 'Correção de bugs gráficos', '2023-09-10'),
(1, '1.1.1', 'Patch de segurança crítico', '2025-07-20'),
(4, '1.0.1', 'Adicionado novo mapa', '2025-02-28'),
(4, '1.1.0', 'Balanceamento de personagens', '2025-06-15'),
(7, '1.0.5', 'Correção de bug que impedia progresso na missão principal', '2024-09-15'),
(8, '2.0.0', 'Expansão "Nitro Boost"', '2024-04-10');

insert into chamado_suporte (jogo_id, funcionario_responsavel_id, titulo, descricao, prioridade, estado) VALUES
(1, 3, 'Bug no menu principal', 'Menu congela ao clicar em "Iniciar"', 'alta', 'aberto'),
(4, 8, 'Falha de conexão', 'Não consigo me conectar aos servidores do modo online.', 'critica', 'em_andamento'),
(7, 8, 'Item duplicado', 'Meu inventário está duplicando itens após a batalha.', 'media', 'resolvido'),
(1, 3, 'Textura não carrega', 'A textura do personagem principal fica em baixa resolução.', 'baixa', 'fechado'),
(4, 8, 'Jogo fecha sozinho', 'O jogo fecha inesperadamente durante a tela de loading.', 'critica', 'aberto'),
(9, 3, 'Save corrompido', 'Perdi todo meu progresso após uma queda de energia.', 'alta', 'em_andamento'),
(7, 8, 'Tradução incorreta', 'Texto em português com erros de gramática na missão X.', 'baixa', 'resolvido'),
(3, null, 'Problema de pagamento', 'Não consigo comprar itens na loja do jogo.', 'alta', 'aberto');

insert into relatorio_bugs (chamado_suporte_id, funcionario_tester_id, descricao, estado) values
(1, 3, 'Bug reproduzido ao clicar rápido 3x', 'em_analise'),
(2, 8, 'Confirmado. Ocorre em redes com latência > 150ms.', 'em_analise'),
(5, 8, 'Enviado para a equipe de desenvolvimento. Crash log anexado.', 'corrigido'),
(6, 3, 'Bug reproduzido. Ocorre com saves maiores que 10MB.', 'novo');