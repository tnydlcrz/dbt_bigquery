{{ config(materialized="table") }} --- se regenera toda la tabla, no es incremental ni snapshot

select
    driver_id, 
    upper(trim(driver_modal)) as driver_modal,
    upper(trim(driver_type)) as driver_type
from {{ source('delivery_raw', 'drivers') }} -- codigo jinja que configura dinamicamente el nombre de la bd, esqueqma y tabla
where driver_id is not null
