-- DML (update com case when)

/*
CASO 1
identifica os programadores que já têm um salário mais alto e os promove automaticamente para o cargo de gerente.
*/

update
    funcionario f
left join
    projeto_equipe pe on f.id = pe.funcionario_id
set
    f.cargo = case
        when f.cargo = 'dev' and f.salario > 6800.00 then 'gerente'
        else f.cargo 
    end,

    f.especialidade = case
        when f.cargo = 'designer' and pe.projeto_id = 1 then 'UI/UX Specialist'
        else f.especialidade
    end;

/*
CASO 2
verifica se um jogo foi lançado ou cancelado e, em seguida, atualiza o status do projeto correspondente para concluído ou pausado
*/

update
    projeto p
inner join
    jogo j on p.jogo_id = j.id
set
    p.estado = case
        when j.estado = 'lancado' and p.estado = 'ativo' then 'concluido'
        when j.estado = 'cancelado' and p.estado = 'ativo' then 'pausado'
        else p.estado
    end 
where
    j.estado in ('lancado', 'cancelado');
