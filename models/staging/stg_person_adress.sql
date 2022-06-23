with source_person_adress as
(
    select 
        addressid			
        , addressline1			
        , addressline2			
        , city			
        , stateprovinceid			
        , postalcode			
        , spatiallocation			
        , rowguid			
        , modifieddate
    from{{ source('aw_proj_final','aw_person_adress') }}
)

select * 
from source_person_adress