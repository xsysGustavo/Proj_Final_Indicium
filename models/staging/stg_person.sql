with source_person as 
(
    select 
        businessentityid as business_entity_id		
        , persontype as person_type
        , namestyle			
        , title		
        , firstname		
        , middlename		
        , lastname		
        , suffix		
        , emailpromotion			
        , additionalcontactinfo		
        , demographics		
        , rowguid		
        , modifieddate
    from {{ source('aw_proj_final','aw_person')}}
)

select * 
from source_person