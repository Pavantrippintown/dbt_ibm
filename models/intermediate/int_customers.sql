{{ config(
    materialized='view'
) }}

with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

nations as (
    select * from {{ ref('stg_nations') }}
),

regions as (
    select * from {{ ref('stg_regions') }}
)

select
    -- Order attributes
    orders.order_id,
    orders.order_date,
    orders.order_status,
    orders.order_priority,
    orders.total_price,
    orders.clerk,
    orders.ship_priority,

    -- Customer attributes
    customers.customer_id,
    customers.customer_name,
    customers.market_segment,
    customers.account_balance,
    customers.phone_number,

    -- Nation attributes
    nations.nation_id,
    nations.nation_name,

    -- Region attributes
    regions.region_id,
    regions.region_name

from orders
left join customers
    on orders.customer_id = customers.customer_id
left join nations
    on customers.nation_id = nations.nation_id
left join regions
    on nations.region_id = regions.region_id