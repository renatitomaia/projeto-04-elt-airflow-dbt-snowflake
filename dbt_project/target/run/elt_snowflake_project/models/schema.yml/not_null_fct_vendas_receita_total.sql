
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select receita_total
from ELT_DATABASE.ANALYTICS.fct_vendas
where receita_total is null



  
  
      
    ) dbt_internal_test