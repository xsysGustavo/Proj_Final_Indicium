with source_person_country_region as
(
    select 
        countryregioncode
        , 'name' as country_name
        , modifieddate
    from{{source('aw_proj_final','aw_person_country_region')}}
)

select *
from
source_person_country_region