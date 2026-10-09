
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id_transacao as unique_field,
    count(*) as n_records

from ELT_DATABASE.ANALYTICS.fct_vendas
where id_transacao is not null
group by id_transacao
having count(*) > 1



  
  
      
    ) dbt_internal_test