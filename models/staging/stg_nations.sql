with source_nations as (
    select
        n_nationkey as nation_id,  -- Make sure this is n_nationkey, NOT n_regionkey
        n_name as nation_name,
        n_regionkey as region_id,
        n_comment as comment
    from {{ source('src', 'nations') }}
)

select * from source_nations