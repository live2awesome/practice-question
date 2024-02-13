with table1 as (select card.account_number,transaction.amount
cast(replace(transaction.amount, 'USD', '')as decimal(10,2)) as currency
from card left join transaction 
on card.card_id = transaction.card_id
where amount like '%USD%'
union all
select card.account_number,transaction.amount
cast(replace(transaction.amount, 'EUR', '')as decimal(10,2)) as currency
from card left join transaction 
on card.card_id = transaction.card_id
where amount like '%EUR%')
, table2 as (
select account_number
case when amount like "%USD%" then currency else 0 end as total_usd,
case when amount like "%EUR%" then currency else 0 end as total_eur
from table1

) select account_number,sum(total_eur) as total_eur,sum(total_usd) as total_usd  from table2 
group by account_number

