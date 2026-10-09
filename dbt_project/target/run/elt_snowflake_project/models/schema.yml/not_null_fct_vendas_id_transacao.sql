
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_transacao
from ELT_DATABASE.ANALYTICS.fct_vendas
where id_transacao is null



  
  
      
    ) dbt_internal_test