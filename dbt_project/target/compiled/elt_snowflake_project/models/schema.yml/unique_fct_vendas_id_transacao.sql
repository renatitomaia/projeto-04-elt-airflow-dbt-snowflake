
    
    

select
    id_transacao as unique_field,
    count(*) as n_records

from ELT_DATABASE.ANALYTICS.fct_vendas
where id_transacao is not null
group by id_transacao
having count(*) > 1


