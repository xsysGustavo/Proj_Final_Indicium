with source_person_country_region as
(
    select 
        countryregioncode as country_region_code
        , `name` as country_name
        , modifieddate as modified_date
    from{{source('aw_proj_final','aw_person_country_region')}}
)

select *
from
source_person_country_region