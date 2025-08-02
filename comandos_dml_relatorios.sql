-- Relatórios (Select)

/*
Relatório 1
Mostra uma lista de todos os funcionários que estão atualmente alocados em projetos ativos, informando em qual jogo eles estão trabalhando e qual é o seu papel na equipe
*/

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

/*
Relatório 2
Este relatório verifica a data da última atualização de cada jogo já lançado e classifica a frequência de suporte
*/

select
    j.nome as nome_do_jogo,
    max(a.data_atualizacao) as ultima_atualizacao,
    case
        when max(a.data_atualizacao) is null then 'Nenhuma atualização registrada'
        when datediff(curdate(), max(a.data_atualizacao)) <= 90 then 'Suporte Ativo (recente)'
        when datediff(curdate(), max(a.data_atualizacao)) between 91 and 365 then 'Suporte Ocasional'
        else 'Suporte Legado (antigo)'
    end as status_do_suporte
from
    jogo j
left join
    atualizacao a on j.id = a.jogo_id
where
    j.estado = 'lancado'
group by
    j.id, j.nome
order by
    ultima_atualizacao desc;

/*
Relatório 3
Este relatório analisa os chamados de suporte abertos e os agrupa por jogo, mas focando em quantos bugs de prioridade alta ou critica cada jogo tem
*/

select
    j.nome as nome_do_jogo,
    j.estado,
    sum(case when cs.prioridade = 'critica' then 1 else 0 end) as bugs_criticos,
    sum(case when cs.prioridade = 'alta' then 1 else 0 end) as bugs_altos,
    sum(case when cs.prioridade in ('media', 'baixa') then 1 else 0 end) as bugs_outros
from
    jogo j
join
    chamado_suporte cs on j.id = cs.jogo_id
where
    cs.estado in ('aberto', 'em_andamento')
group by
    j.id, j.nome
order by
    bugs_criticos desc, bugs_altos desc;

/*
Relatório 4
Este relatório exibe as publicadoras brasileiras na qual seu contrato já foi encerrado e quantidade de jogos publicadas pela mesma.
*/

select
    p.nome AS publicadora,
    cout(j.id) as total_jogos,
    p.contrato_fim
from
    publicadora p
left join
    jogo j on j.publicadora_id = p.id
where
    p.pais = 'Brasil' 
    and p.contrato_fim < curdate()
group by 
    p.id, p.nome, p.contrato_fim
order by
    total_jogos desc;

/*
Relatório 5
Relatório de chamados de suporte para jogos de publicadoras brasileiras com contrato ativo, detalhando a quantidade de chamados abertos, em andamento, e resolvidos por publicadora, junto com o funcionário responsável que mais atende chamados.
*/

select 
    pub.nome as publicadora,
    count(case when cs.estado = 'aberto' then 1 end) as chamados_abertos,
    count(case when cs.estado = 'em_andamento' then 1 end) as chamados_em_andamento,
    count(case when cs.estado in ('resolvido', 'fechado') then 1 end) as chamados_resolvidos,
    
    (select f.nome
     from chamado_suporte cs2
     join jogo j2 on cs2.jogo_id = j2.id
     join funcionario f on cs2.funcionario_responsavel_id = f.id
     where j2.publicadora_id = pub.id
     group by f.nome
     order by count(*) desc
     limit 1) as funcionario_mais_responsavel
from 
    publicadora pub
join 
    jogo j on j.publicadora_id = pub.id
join 
    chamado_suporte cs on cs.jogo_id = j.id
where 
    pub.pais = 'Brasil'
    and (pub.contrato_fim is null or pub.contrato_fim >= curdate()) 
group by 
    pub.id, pub.nome
order by 
    chamados_abertos desc;
