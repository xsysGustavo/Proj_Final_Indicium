with
 person_address as (
    select *
    from {{ ref('stg_person_adress') }}
)

,person_state_province as (
    select *
    from {{ ref('stg_person_state_province') }}
)

,person_country_region as (
    select *
    from {{ ref('stg_person_country_region') }}
)


, joining as (
    select
         row_number() over (order by person_address.address_id) as location_sk
        ,person_address.address_id
        ,person_address.city
        ,person_address.address_line_1
        ,person_address.address_line_2
        ,person_state_province.state_province_name
        ,person_country_region.country_name
        ,person_state_province.country_region_code
        ,person_address.postal_code
    from person_address
    left join person_state_province 
        on person_address.state_province_id = person_state_province.state_province_id
    left join person_country_region
        on person_state_province.country_region_code = person_country_region.country_region_code
)

select *
from joining