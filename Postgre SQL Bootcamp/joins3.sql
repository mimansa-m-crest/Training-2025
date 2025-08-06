INSERT INTO T1(AD_DATE, COL1,COL2, COL3) VALUES ('2025-02-05', 4,5,6)


select 
coalesce(t1.ad_date, t2.ad_date) as "add_date",
coalesce(t1.col1, t2.col1) as col1,
coalesce(t1.col2, t2.col2) as col2,
coalesce(t1.col3, t2.col3) as col3,
t2.col4,
t2.col5
from t1 full outer join t2  on 	(t1.ad_date = t2.ad_date)
