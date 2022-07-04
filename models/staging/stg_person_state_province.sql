with source_state_province as
(
    select 
        stateprovinceid as state_province_id
        ,stateprovincecode as state_province_code
        ,countryregioncode as country_region_code
        ,isonlystateprovinceflag as is_only_state_province_flag
        ,`name` as state_province_name
        ,territoryid as territory_id
        ,rowguid as row_guid
    from{{source('aw_proj_final','aw_person_state_province')}}
)

select * from source_state_province