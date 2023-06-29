select
    user.username,
    sum(subscription_price) sum_subscription_price
from {{ source('mongodb', 'user') }}
  left join {{ ref('stg_payments') }} as payments on payments.user_id = user.user_id
group by user.username
having sum(subscription_price) is not null
order by 2 desc
limit 10