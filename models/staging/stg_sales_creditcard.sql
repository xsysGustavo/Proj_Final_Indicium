with source_person_adress as
(
    select 
        creditcardid
        ,cardtype
        ,cardnumber
        ,expmonth
        ,expyear
        ,modifieddate
    from{{ source('aw_proj_final','aw_sales_creditcard')}}
)

select * from source_person_adress