with source_state_province as
(
    select 
    customerid
    ,personid
    ,storeid
    ,territoryid
    ,rowguid			
    ,modifieddate
    from{{source('aw_proj_final','aw_person_state_province')}}
)

select * from source_state_province