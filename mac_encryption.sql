with table1 as (
    select accounts,id,accounts.mac_add ,encryptions.salt,encryptions.is_active 
    from accounts left join encryptions
    on accounts.id = encryptions.acc_id where is_active ='1' and len(salt)< 8

)
select mac_add ,count(salt) as salt from table1 group by mac_add
