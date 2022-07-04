with source_person_adress as
(
    select 
        creditcardid as credit_card_id
        ,cardtype as card_type
        ,cardnumber as card_number
        ,expmonth as exp_month
        ,expyear as exp_year
        ,modifieddate as modified_date
    from{{ source('aw_proj_final','aw_sales_creditcard')}}
)

select * from source_person_adress