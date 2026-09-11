with customers as (
    select * from {{ ref('stg_customers') }}
),

nations as (
    select * from {{ ref('stg_nations') }}
),

regions as (
    select * from {{ ref('stg_regions') }}
)

select
    -- Customer attributes
    c.customer_id,
    c.customer_name,
    c.address,
    c.phone_number,
    c.account_balance,
    c.market_segment,

    -- Location attributes
    n.nation_name,
    r.region_name

from customers c
left join nations n
    on c.nation_id = n.nation_id
left join regions r
    on n.region_id = r.region_id