select 
P.code 
,P.date
,P.ownerid,P.owneridname,P.Accompany1,P.Accompany2,P.Accompany3,P.Period
,P.Territory,P.DSM_E,P.new_location
,P.accountnumber,P.new_accountidname
,P.address1_stateorprovince,P.new_e_plan_amount1
,P.Times,P.new_itemcode,P.new_e_item1_idname
,P.new_productbrand,P.New_TotalExcludeVAT
,case when P.New_TotalExcludeVAT  IS NULL then 0 
		  when P.New_TotalExcludeVAT < = 0 then 0 
		  else 1 end Stiker_Hit 

from
(
select 
P50_1.code 
,P50_1.date
,P50_1.ownerid,P50_1.owneridname,P50_1.Accompany1,P50_1.Accompany2,P50_1.Accompany3,P50_1.new_time as Period
,P50_1.Territory,P50_1.DSM_E,P50_1.new_location
,P50_1.accountnumber,P50_1.new_accountidname
,P50_1.address1_stateorprovince,P50_1.new_e_plan_amount1
,P50_1.Times,P50_1.new_itemcode,P50_1.new_e_item1_idname
,P50_1.new_productbrand,TMP_TCA.New_TotalExcludeVAT

from
(

select 
Plan50_1.accountnumber+ Plan50_1.new_itemcode as code 
,CONVERT(datetime,Plan50_1.new_date,105) as date
,Plan50_1.ownerid,Plan50_1.owneridname,Plan50_1.Territory,Plan50_1.DSM_E,Plan50_1.new_location
,Plan50_1.accountnumber,Plan50_1.new_accountidname,Plan50_1.Accompany1,Plan50_1.Accompany2,Plan50_1.Accompany3,Plan50_1.new_time
,Plan50_1.address1_stateorprovince,Plan50_1.new_e_plan_amount1
,Plan50_1.Times,Plan50_1.new_itemcode,Plan50_1.new_e_item1_idname
,Plan50_1.new_productbrand
from
(
select all_data.*,emp.sup_name,emp.DSM_E,emp.new_location
from
(
--*****************************************Existing SKU #1*******************************
select
sku1.New_itinerary_result_otcid,sku1.New_itineraryresultid
,sku1.new_date
,sku1.ownerid
,sku1.owneridname
,sku1.Territory
,sku1.Team
,sku1.Accompany1
,sku1.Accompany2
,sku1.Accompany3
,sku1.new_seqnum
,sku1.new_accountid,acc.accountnumber
,sku1.new_accountidname,acc.address1_stateorprovince
,sku1.new_address,sku1.new_time
,sku1.new_e_plan_amount1,----ราคา
sku1.new_e_item1_id, ----item
sku1.new_e_item1_idname,---name
sku1.new_e_key1_idname --message
,sku1.Times,sku1.new_itemcode,sku1.New_productbrand

from
(
select
data.New_itinerary_result_otcid,data.New_itineraryresultid
,data.new_date
,data.ownerid
,data.owneridname
,data.Territory
,data.Team
,data.Accompany1
,data.Accompany2
,data.Accompany3
,data.new_seqnum
,data.new_accountid
,data.new_accountidname,data.new_address,data.new_time
,data.new_e_plan_amount1,----ราคา
data.new_e_item1_id, ----item
data.new_e_item1_idname,---name
data.new_e_key1_idname --message
,data.Times,item.new_itemcode,item.New_productbrand
from
(
select
ir.New_itinerary_result_otcid,iri.New_itineraryresultid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName as Territory
,users.new_Tmp_teamName as Team
,ir.new_plan_all_ref1idname as Accompany1
,ir.new_plan_all_ref2idname as Accompany2
,ir.new_plan_all_ref3idname as Accompany3
,iri.new_seqnum
,iri.new_accountid
,iri.new_accountidname,iri.new_address,iri.new_time
,iri.new_e_plan_amount1,----ราคา
iri.new_e_item1_id, ----item
iri.new_e_item1_idname,---name
iri.new_e_key1_idname --message
,'Existing SKU #1' as  Times
from filteredNew_itinerary_result_otc ir
inner join filteredNew_itinerary_result_otc_i iri
on ir.new_itinerary_result_otcid =iri.new_itineraryresultid
inner join FilteredSystemUser users
on ir.ownerid = users.SystemUserId
where 1=1
and ir.statecode =0
and ir.statuscode = 1

and iri.statecode =0
and iri.statuscode = 1
and iri.new_plan_or_visit = 0

--and ir.ownerid in  ('16B74EBD-F91C-E311-A54A-BC305BE19597')/*User On system*/
--and year(ir.new_date) =  year(getdate())/*Curent Year*/
--and month(ir.new_date) in ('06')--(@Month)/*Month*/
----and day(ir.new_date) in ('07')/*Date*/

--and ir.ownerid in  (@employee)/*User On system*/
and year(ir.new_date) =  year(getdate())/*Curent Year*/
and month(ir.new_date) in (@Month)   /*Month*/

--and day(ir.new_date) in ('07')/*Date*/

group by
ir.New_itinerary_result_otcid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName
,users.new_Tmp_teamName
,ir.new_plan_all_ref1idname
,ir.new_plan_all_ref2idname
,ir.new_plan_all_ref3idname
,iri.New_itineraryresultid
,iri.New_itineraryresultid,iri.new_seqnum,iri.new_accountidname,iri.new_address,new_time,iri.new_accountid
,iri.new_e_plan_amount1,iri.new_e_item1_id,iri.new_e_item1_idname,iri.new_e_key1_idname----EXISTING  SKU#1
)data
INNER JOIN
(
select  new_itemid,new_itemcode,New_productbrand from filteredNew_item
)item on data.new_e_item1_id = item.new_itemid
)sku1
inner join (select accountid, accountnumber,name,address1_stateorprovince from FilteredAccount) acc
on sku1.new_accountid = acc.accountid
--*****************************************Existing SKU #1*******************************
UNION
--*****************************************Existing SKU #2*******************************
select
sku1.New_itinerary_result_otcid,sku1.New_itineraryresultid
,sku1.new_date
,sku1.ownerid
,sku1.owneridname
,sku1.Territory
,sku1.Team
,sku1.Accompany1
,sku1.Accompany2
,sku1.Accompany3
,sku1.new_seqnum
,sku1.new_accountid,acc.accountnumber
,sku1.new_accountidname,acc.address1_stateorprovince
,sku1.new_address,sku1.new_time
,sku1.new_e_plan_amount2,----ราคา
sku1.new_e_item2_id, ----item
sku1.new_e_item2_idname,---name
sku1.new_e_key2_idname --message
,sku1.Times,sku1.new_itemcode,sku1.New_productbrand

from
(
select
data.New_itinerary_result_otcid,data.New_itineraryresultid
,data.new_date
,data.ownerid
,data.owneridname
,data.Territory
,data.Team
,data.Accompany1
,data.Accompany2
,data.Accompany3
,data.new_seqnum
,data.new_accountid
,data.new_accountidname,data.new_address,data.new_time
,data.new_e_plan_amount2,----ราคา
data.new_e_item2_id, ----item
data.new_e_item2_idname,---name
data.new_e_key2_idname --message
,data.Times,item.new_itemcode,item.New_productbrand
from
(
select
ir.New_itinerary_result_otcid,iri.New_itineraryresultid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName as Territory
,users.new_Tmp_teamName as Team
,ir.new_plan_all_ref1idname as Accompany1
,ir.new_plan_all_ref2idname as Accompany2
,ir.new_plan_all_ref3idname as Accompany3
,iri.new_seqnum
,iri.new_accountid
,iri.new_accountidname,iri.new_address,iri.new_time
,iri.new_e_plan_amount2,----ราคา
iri.new_e_item2_id, ----item
iri.new_e_item2_idname,---name
iri.new_e_key2_idname --message
,'Existing SKU #2' as  Times
from filteredNew_itinerary_result_otc ir
inner join filteredNew_itinerary_result_otc_i iri
on ir.new_itinerary_result_otcid =iri.new_itineraryresultid
inner join FilteredSystemUser users
on ir.ownerid = users.SystemUserId
where 1=1
and ir.statecode =0
and ir.statuscode = 1


and iri.statecode =0
and iri.statuscode = 1
and iri.new_plan_or_visit = 0
--and ir.ownerid in  ('16B74EBD-F91C-E311-A54A-BC305BE19597')/*User On system*/
--and year(ir.new_date) =  year(getdate())/*Curent Year*/
--and month(ir.new_date) in ('06')--(@Month)/*Month*/
----and day(ir.new_date) in ('07')/*Date*/

--and ir.ownerid in  (@employee)/*User On system*/
and year(ir.new_date) =  year(getdate())/*Curent Year*/
and month(ir.new_date) in  (@Month)  /*Month*/
--and day(ir.new_date) in ('07')/*Date*/

group by
ir.New_itinerary_result_otcid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName
,users.new_Tmp_teamName
,ir.new_plan_all_ref1idname
,ir.new_plan_all_ref2idname
,ir.new_plan_all_ref3idname
,iri.New_itineraryresultid
,iri.New_itineraryresultid,iri.new_seqnum,iri.new_accountidname,iri.new_address,new_time,iri.new_accountid
,iri.new_e_plan_amount2,iri.new_e_item2_id,iri.new_e_item2_idname,iri.new_e_key2_idname----EXISTING  SKU#1
)data
INNER JOIN
(
select  new_itemid,new_itemcode,New_productbrand from filteredNew_item
)item on data.new_e_item2_id = item.new_itemid
)sku1
inner join (select accountid, accountnumber,name,address1_stateorprovince from FilteredAccount) acc
on sku1.new_accountid = acc.accountid

--*****************************************Existing SKU #2*******************************
UNION
--*****************************************Existing SKU #3*******************************
select
sku1.New_itinerary_result_otcid,sku1.New_itineraryresultid
,sku1.new_date
,sku1.ownerid
,sku1.owneridname
,sku1.Territory
,sku1.Team
,sku1.Accompany1
,sku1.Accompany2
,sku1.Accompany3
,sku1.new_seqnum
,sku1.new_accountid,acc.accountnumber
,sku1.new_accountidname,acc.address1_stateorprovince
,sku1.new_address,sku1.new_time
,sku1.new_e_plan_amount3,----ราคา
sku1.new_e_item3_id, ----item
sku1.new_e_item3_idname,---name
sku1.new_e_key3_idname --message
,sku1.Times,sku1.new_itemcode,sku1.New_productbrand

from
(
select
data.New_itinerary_result_otcid,data.New_itineraryresultid
,data.new_date
,data.ownerid
,data.owneridname
,data.Territory
,data.Team
,data.Accompany1
,data.Accompany2
,data.Accompany3
,data.new_seqnum
,data.new_accountid
,data.new_accountidname,data.new_address,data.new_time
,data.new_e_plan_amount3,----ราคา
data.new_e_item3_id, ----item
data.new_e_item3_idname,---name
data.new_e_key3_idname --message
,data.Times,item.new_itemcode,item.New_productbrand
from
(
select
ir.New_itinerary_result_otcid,iri.New_itineraryresultid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName as Territory
,users.new_Tmp_teamName as Team
,ir.new_plan_all_ref1idname as Accompany1
,ir.new_plan_all_ref2idname as Accompany2
,ir.new_plan_all_ref3idname as Accompany3
,iri.new_seqnum
,iri.new_accountid
,iri.new_accountidname,iri.new_address,iri.new_time
,iri.new_e_plan_amount3,----ราคา
iri.new_e_item3_id, ----item
iri.new_e_item3_idname,---name
iri.new_e_key3_idname --message
,'Existing SKU #3' as  Times
from filteredNew_itinerary_result_otc ir
inner join filteredNew_itinerary_result_otc_i iri
on ir.new_itinerary_result_otcid =iri.new_itineraryresultid
inner join FilteredSystemUser users
on ir.ownerid = users.SystemUserId
where 1=1
and ir.statecode =0
and ir.statuscode = 1


and iri.statecode =0
and iri.statuscode = 1
and iri.new_plan_or_visit = 0

--and ir.ownerid in  ('16B74EBD-F91C-E311-A54A-BC305BE19597')/*User On system*/
--and year(ir.new_date) =  year(getdate())/*Curent Year*/
--and month(ir.new_date) in ('06')--(@Month)/*Month*/
----and day(ir.new_date) in ('07')/*Date*/

--and ir.ownerid in  (@employee)/*User On system*/
and year(ir.new_date) =  year(getdate())/*Curent Year*/
and month(ir.new_date) in  (@Month)  /*Month*/
--and day(ir.new_date) in ('07')/*Date*/

group by
ir.New_itinerary_result_otcid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName
,users.new_Tmp_teamName
,ir.new_plan_all_ref1idname
,ir.new_plan_all_ref2idname
,ir.new_plan_all_ref3idname
,iri.New_itineraryresultid
,iri.New_itineraryresultid,iri.new_seqnum,iri.new_accountidname,iri.new_address,new_time,iri.new_accountid
,iri.new_e_plan_amount3,iri.new_e_item3_id,iri.new_e_item3_idname,iri.new_e_key3_idname----EXISTING  SKU#1
)data
INNER JOIN
(
select  new_itemid,new_itemcode,New_productbrand from filteredNew_item
)item on data.new_e_item3_id = item.new_itemid
)sku1
inner join (select accountid, accountnumber,name,address1_stateorprovince from FilteredAccount) acc
on sku1.new_accountid = acc.accountid

--*****************************************Existing SKU #3*******************************

UNION
--*****************************************New SKU #1*******************************
select
sku1.New_itinerary_result_otcid,sku1.New_itineraryresultid
,sku1.new_date
,sku1.ownerid
,sku1.owneridname
,sku1.Territory
,sku1.Team
,sku1.Accompany1
,sku1.Accompany2
,sku1.Accompany3
,sku1.new_seqnum
,sku1.new_accountid,acc.accountnumber
,sku1.new_accountidname,acc.address1_stateorprovince
,sku1.new_address,sku1.new_time
,sku1.new_n_plan_amount1,----ราคา
sku1.new_n_item1_id, ----item
sku1.new_n_brand1_idname,---name
sku1.new_n_item1_idname --message
,sku1.Times,sku1.new_itemcode,sku1.New_productbrand
from
(
select
data2.New_itinerary_result_otcid,data2.New_itineraryresultid
,data2.new_date
,data2.ownerid
,data2.owneridname
,data2.Territory
,data2.Team
,data2.Accompany1
,data2.Accompany2
,data2.Accompany3
,data2.new_seqnum
,data2.new_accountid
,data2.new_accountidname,data2.new_address,data2.new_time
,data2.new_n_plan_amount1,----ราคา
data2.new_n_item1_id, ----item
data2.new_n_brand1_idname,---name
data2.new_n_item1_idname --message
,data2.Times,item.new_itemcode,item.New_productbrand
from
(
select
ir.New_itinerary_result_otcid,iri.New_itineraryresultid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName as Territory
,users.new_Tmp_teamName as Team
,ir.new_plan_all_ref1idname as Accompany1
,ir.new_plan_all_ref2idname as Accompany2
,ir.new_plan_all_ref3idname as Accompany3
,iri.new_seqnum
,iri.new_accountid
,iri.new_accountidname,iri.new_address,iri.new_time
,iri.new_n_plan_amount1,----ราคา
iri.new_n_item1_id, ----item
iri.new_n_brand1_idname,---name
iri.new_n_item1_idname --message
,'New SKU #1' as  Times
----EXISTING  SKU#2
from filteredNew_itinerary_result_otc ir
inner join filteredNew_itinerary_result_otc_i iri
on ir.new_itinerary_result_otcid =iri.new_itineraryresultid
inner join FilteredSystemUser users
on ir.ownerid = users.SystemUserId
where 1=1
and ir.statecode =0
and ir.statuscode = 1


and iri.statecode =0
and iri.statuscode = 1
and iri.new_plan_or_visit = 0

--and ir.ownerid in  ('16B74EBD-F91C-E311-A54A-BC305BE19597')/*User On system*/
--and year(ir.new_date) =  year(getdate())/*Curent Year*/
--and month(ir.new_date) in ('06')--(@Month)/*Month*/
----and day(ir.new_date) in ('07')/*Date*/
--and ir.ownerid in  (@employee)/*User On system*/
and year(ir.new_date) =  year(getdate())/*Curent Year*/
and month(ir.new_date) in  (@Month) /*Month*/
--and day(ir.new_date) in ('07')/*Date*/

group by
ir.New_itinerary_result_otcid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName
,users.new_Tmp_teamName
,ir.new_plan_all_ref1idname
,ir.new_plan_all_ref2idname
,ir.new_plan_all_ref3idname
,iri.New_itineraryresultid
,iri.New_itineraryresultid,iri.new_seqnum,iri.new_accountidname,iri.new_address,new_time,iri.new_accountid
,iri.new_n_plan_amount1,----ราคา
iri.new_n_item1_id, ----item
iri.new_n_brand1_idname,---name
iri.new_n_item1_idname --message
)data2
INNER JOIN
(
select  new_itemid,new_itemcode,New_productbrand from filteredNew_item
)item on data2.new_n_item1_id = item.new_itemid
)sku1
inner join (select accountid, accountnumber,name,address1_stateorprovince from FilteredAccount) acc
on sku1.new_accountid = acc.accountid

--*****************************************New SKU #1*******************************
UNION
--*****************************************New SKU #2*******************************
select
sku1.New_itinerary_result_otcid,sku1.New_itineraryresultid
,sku1.new_date
,sku1.ownerid
,sku1.owneridname
,sku1.Territory
,sku1.Team
,sku1.Accompany1
,sku1.Accompany2
,sku1.Accompany3
,sku1.new_seqnum
,sku1.new_accountid,acc.accountnumber
,sku1.new_accountidname,acc.address1_stateorprovince
,sku1.new_address,sku1.new_time
,sku1.new_n_plan_amount2,----ราคา
sku1.new_n_item2_id, ----item
sku1.new_n_brand2_idname,---name
sku1.new_n_item2_idname --message
,sku1.Times,sku1.new_itemcode,sku1.New_productbrand
from
(
select
data2.New_itinerary_result_otcid,data2.New_itineraryresultid
,data2.new_date
,data2.ownerid
,data2.owneridname
,data2.Territory
,data2.Team
,data2.Accompany1
,data2.Accompany2
,data2.Accompany3
,data2.new_seqnum
,data2.new_accountid
,data2.new_accountidname,data2.new_address,data2.new_time
,data2.new_n_plan_amount2,----ราคา
data2.new_n_item2_id, ----item
data2.new_n_brand2_idname,---name
data2.new_n_item2_idname --message
,data2.Times,item.new_itemcode,item.New_productbrand
from
(
select
ir.New_itinerary_result_otcid,iri.New_itineraryresultid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName as Territory
,users.new_Tmp_teamName as Team
,ir.new_plan_all_ref1idname as Accompany1
,ir.new_plan_all_ref2idname as Accompany2
,ir.new_plan_all_ref3idname as Accompany3
,iri.new_seqnum
,iri.new_accountid
,iri.new_accountidname,iri.new_address,iri.new_time
,iri.new_n_plan_amount2,----ราคา
iri.new_n_item2_id, ----item
iri.new_n_brand2_idname,---name
iri.new_n_item2_idname --message
,'New SKU #2' as  Times
----EXISTING  SKU#2
from filteredNew_itinerary_result_otc ir
inner join filteredNew_itinerary_result_otc_i iri
on ir.new_itinerary_result_otcid =iri.new_itineraryresultid
inner join FilteredSystemUser users
on ir.ownerid = users.SystemUserId
where 1=1
and ir.statecode =0
and ir.statuscode = 1

and iri.statecode =0
and iri.statuscode = 1
and iri.new_plan_or_visit = 0

--and ir.ownerid in  ('16B74EBD-F91C-E311-A54A-BC305BE19597')/*User On system*/
--and year(ir.new_date) =  year(getdate())/*Curent Year*/
--and month(ir.new_date) in ('06')--(@Month)/*Month*/
----and day(ir.new_date) in ('07')/*Date*/

--and ir.ownerid in  (@employee)/*User On system*/
and year(ir.new_date) =  year(getdate())/*Curent Year*/
and month(ir.new_date) in  (@Month)  /*Month*/
--and day(ir.new_date) in ('07')/*Date*/
group by
ir.New_itinerary_result_otcid
,ir.new_date
,ir.ownerid
,ir.owneridname
,users.new_Tmp_territoryName
,users.new_Tmp_teamName
,ir.new_plan_all_ref1idname
,ir.new_plan_all_ref2idname
,ir.new_plan_all_ref3idname
,iri.New_itineraryresultid
,iri.New_itineraryresultid,iri.new_seqnum,iri.new_accountidname,iri.new_address,new_time,iri.new_accountid
,iri.new_n_plan_amount2,----ราคา
iri.new_n_item2_id, ----item
iri.new_n_brand2_idname,---name
iri.new_n_item2_idname --message
)data2
INNER JOIN
(
select  new_itemid,new_itemcode,New_productbrand from filteredNew_item
)item on data2.new_n_item2_id = item.new_itemid
)sku1
inner join (select accountid, accountnumber,name,address1_stateorprovince from FilteredAccount) acc
on sku1.new_accountid = acc.accountid

--*****************************************New SKU #2*******************************
)all_data
Left Join 
(
select xx.*
from(
select x.new_tmp_territoryname,x.sup_id,x.sup_name 
,replace(y.internalemailaddress,'@biopharm.co.th','' ) as DSM_E ,x.new_location
from
(
select s.systemuserid,s.fullname,s.internalemailaddress ,s.new_tmp_territoryname
,emp.sup_id,emp.sup_name,emp.new_location
from FilteredSystemUser s 

inner join 
(
select distinct
              st.new_territoryidname as territory,
              emp.new_salesrepid as salesrep_id,
              emp.new_salesrep_name as salesrep_name,
              emp.new_supid as sup_id,
              emp.new_sup_name as sup_name,
              emp.new_smid as sm_id,
              emp.new_sm_name as sm_name,
              emp.new_location,
              emp.new_channel
              from FilteredNew_employee_data emp,
                      FilteredNew_salesterritory st
              where new_company_id = 81
              and st.new_userid = emp.new_salesrepid
              and st.new_enddate is null
              and st.new_territoryidname not like 'OLD%'
              and st.new_territoryidname not like 'CC%'
              union
              select distinct
              'DSM' as territory,
              emp.new_supid as salesrep_id,
              emp.new_sup_name as salesrep_name,
              null as sup_id,
              null as sup_name,
              emp.new_smid as sm_id,
              emp.new_sm_name as sm_name,
              emp.new_location,
              emp.new_channel
              from FilteredNew_employee_data emp,
                      FilteredNew_salesterritory st
              where new_company_id = 81
              and st.new_userid = emp.new_salesrepid
              and st.new_enddate is null
              and st.new_territoryidname not like 'OLD%'
              and st.new_territoryidname not like 'CC%'
              union
              select distinct
              'SM' as territory,
              emp.new_smid as salesrep_id,
              emp.new_sm_name as salesrep_name,
              null as sup_id,
              null as sup_name,
              null as sm_id,
              null as sm_name,
              emp.new_location,
              emp.new_channel
              from FilteredNew_employee_data emp,
                      FilteredNew_salesterritory st
              where new_company_id = 81
              and st.new_userid = emp.new_salesrepid
              and st.new_enddate is null
              and st.new_territoryidname not like 'OLD%'
              and st.new_territoryidname not like 'CC%'

) emp on s.systemuserid = emp.salesrep_id
where s.new_tmp_territoryname is not null and emp.new_channel = 'OTC'
)x
inner join
(select a.systemuserid,a.internalemailaddress
 from FilteredSystemUser  a
) y on x.sup_id = y.systemuserid
)xx where 1=1
) emp  on all_data.Territory = emp.new_tmp_territoryname
)Plan50_1
)P50_1
LEFT JOIN
(
select cc.New_customer_number+cc.New_item_code as code  ,cc.New_customer_number,cc.New_item_code 
,cc.New_amount  as New_TotalExcludeVAT
from  filteredNew_callcardreport2 cc 
where 1=1
and cc.New_year = YEAR(getdate())
and cc.New_month  in (@Month) /*Month*/ 
) TMP_TCA on P50_1.code = TMP_TCA.Code
)P
where p.Territory in (@employee)
