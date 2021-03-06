SELECT  cast(LOANDATETIME as date) as Date, count(*) as Count, sum(LOANAMOUNT) as Amount, 'OUT' direction
FROM loanprovisionservice
where RESULTCODE = 0
group by cast(LOANDATETIME as date)
UNION ALL
SELECT  cast(COLLECTIONDATETIME as date) as Date, count(*) as Count, sum(CHARGEDAMOUNT) as Amount, 'IN' direction
FROM loancollectionservice
where RESULTCODE = 1
group by cast(COLLECTIONDATETIME as date)
