
{{ config(materialized="table") }} --- se regenera toda la tabla, no es incremental ni snapshot

select 
store_id,
hub_id,
upper(trim(store_name)) as store_name,
upper(trim(store_segment)) as store_segment,
coalesce(store_plan_price, 0) as store_plan_price,
store_latitude,
store_longitude
from {{ source('delivery_raw', 'stores') }} -- codigo jinja que configura dinamicamente el nombre de la bd, esqueqma y tabla
where store_id is not null




/*
{{ config(materialized="table") }}

SELECT
   *
FROM {{ source('delivery_raw', 'stores') }}
*/