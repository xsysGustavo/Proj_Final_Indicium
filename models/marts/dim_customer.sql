with
 person as (
    select *
    from {{ ref('stg_person') }}
)

,sales_customer as (
    select *
    from {{ ref('stg_sales_customer') }}
)

, joining as (
    select
        row_number() over (order by person.business_entity_id) as customer_sk
        ,sales_customer.customer_id
        ,person.business_entity_id
        ,sales_customer.person_id
        ,person.person_type
        ,person.first_name
        ,person.middle_name
        ,person.last_name
    from person
    left join sales_customer 
        on person.business_entity_id = sales_customer.person_id
)

select *
from joining