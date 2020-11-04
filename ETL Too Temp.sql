select  ROW_NUMBER() OVER (PARTITION BY data10.FormatDate ,data10.Visit_Accompany  ORDER By data10.FormatDate ) as  Plan_Number  ,data10.Plan_No,data10.Plan_mark,NULL as Plan_Remark
,data10.new_itinerary_resultid,data10.owner,data10.FormatDate,data10.Plan_Date ,data10.new_date     
,data10.Plan_Period  
,data10.Plan_Time   /*, data10.Plan_Activities*/
,data10.Planner
, data10.Plan_Activities
,data10.Plan_province 
,data10.Plan_Territory 
,data10.Plan_Accompany 
 ,ROW_NUMBER() OVER (PARTITION BY data10.FormatDate ,data10.Visit_Accompany  ORDER By data10.FormatDate ) as Visit_Number  
,data10.Visit_No ,data10.Visit_mark,NULL as Visit_Remark
,data10.Visit_Territory,data10. Visitter,data10.Visitter1,data10.Plannerxxxxx
,data10.Visit_Date,data10.Visit_Period ,   data10.Visit_Time,data10.Visit_Activities,data10.Visit_Province	,data10.Visit_SupId	, data10.Visit_Accompany
,data10.new_coaching_day,data10.call_frequency,data10.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data10. Check_SupPlan ,data10.Check_PlanPeriod,data10.coaching_call1
,data10. CoachingDay 
,data10.CompletetinDate_WO
,data10.CompletetinDate_Rep	
,data10.Check_Complete
, data10.Time_Case_Complete
, data10.CompletetionDate  
, data10. Planner1
,data10.New_amt_coach_day,  data10.New_amt_coach_call,data10.New_amt_plan,data10.New_amt_visit,data10.New_day_exc,data10.New_day_inc,data10.New_target_coach_call,data10.New_target_coach_day,
data10.sm_name,data10.Completetion_Date
from(
select  data9.Plan_No ,data9.Plan_mark
,data9.new_itinerary_resultid,data9.owner,data9.FormatDate,data9.Plan_Date ,data9.new_date     
,data9.Plan_Period  
,data9.Plan_Time   /*, data9.Plan_Activities*/
,data9.Planner
, data9.Plan_Activities
,data9.Plan_province 
,data9.Plan_Territory 
,data9.Plan_Accompany 
,data9.Visit_No ,data9.Visit_mark
,data9.Visit_Territory
,data9. Visitter
,data9.Visitter1
,data9.Plannerxxxxx
,data9.Visit_Date,data9.Visit_Period ,   data9.Visit_Time
 ,data9.Visit_Activities
 ,data9.Visit_Province	,data9.Visit_SupId	, data9.Visit_Accompany
,data9.new_coaching_day,data9.call_frequency,data9.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data9. Check_SupPlan ,data9.Check_PlanPeriod,data9.coaching_call1
,data9. CoachingDay 
,data9.CompletetinDate_WO
,data9.CompletetinDate_Rep	
,data9.Check_Complete
, data9.Time_Case_Complete
, data9.CompletetionDate  
, data9. Planner1
,data9.New_amt_coach_day,  data9.New_amt_coach_call,data9.New_amt_plan,data9.New_amt_visit,data9.New_day_exc,data9.New_day_inc,data9.New_target_coach_call,data9.New_target_coach_day,
data9.sm_name,NULL as Completetion_Date
from(
select  ROW_NUMBER() OVER (PARTITION BY data8.FormatDate ,data8.Visit_Accompany  ORDER By data8.FormatDate ) as  Plan_No ,NULL as Plan_mark
,data8.new_itinerary_resultid,data8.owner,data8.FormatDate,data8.Plan_Date ,data8.new_date     
,data8.Plan_Period  
,data8.Plan_Time   /*, data8.Plan_Activities*/
--,data8.Planner
,case when data8.Plan_Activities IS NULL then NULL else data8.Visitter end  as Planner
, data8.Plan_Activities
,case when data8.Plan_Activities IS NULL then NULL else  data8.Plan_province end Plan_province 
,data8.Plan_Territory 
,data8.Plan_Accompany 
,ROW_NUMBER() OVER (PARTITION BY data8.FormatDate ,data8.Visit_Accompany  ORDER By data8.FormatDate ) as Visit_No ,NULL as Visit_mark
,data8.Visit_Territory
,data8. Visitter
--,Case When ROW_NUMBER() OVER(partition by  data8. Visit_Date,data8.Plan_Period  ORDER BY  data8.Visit_Period ,data8.Visit_Territory  ASC) = 1 then 1 else NULL  end Visitter1
,Case When ROW_NUMBER() OVER(partition by  data8. Visit_Date,data8.Visit_Accompany  ORDER BY  data8.Visit_Period    ASC) = 1 then 1 else NULL  end Visitter1
,Case When ROW_NUMBER() OVER(partition by  data8. Plan_Date,data8.Visit_Accompany  ORDER BY  data8.Visit_Period    ASC) = 1 then 1 else NULL  end Plannerxxxxx

,data8.Visit_Date,data8.Visit_Period ,   data8.Visit_Time
 ,data8.Visit_Activities
 ,data8.Visit_Province	,data8.Visit_SupId	, data8.Visit_Accompany
,data8.new_coaching_day,data8.call_frequency,data8.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data8. Check_SupPlan ,data8.Check_PlanPeriod,data8.coaching_call1
,data8. CoachingDay 
,data8.CompletetinDate_WO
,data8.CompletetinDate_Rep	
,data8.Check_Complete
, data8.Time_Case_Complete
, data8.CompletetionDate  
, data8. Planner1
,data8.New_amt_coach_day,  data8.New_amt_coach_call,data8.New_amt_plan,data8.New_amt_visit,data8.New_day_exc,data8.New_day_inc,data8.New_target_coach_call,data8.New_target_coach_day,
emp.sm_name
from(
select  data7.new_itinerary_resultid,data7.owner,data7.FormatDate,data7.Plan_Date ,data7.new_date     
,data7.Plan_Period  
,data7.Plan_Time   /*, data7.Plan_Activities*/
,data7.Planner
, data7.Plan_Activities
,case when data7.Plan_Activities IS NULL then NULL else  data7.Plan_province end Plan_province 
,data7.Plan_Territory 
,data7.Plan_Accompany,data7.Visit_Territory
,data7. Visitter
,data7.Visit_Date,data7.Visit_Period ,   data7.Visit_Time
 ,data7.Visit_Activities
 ,data7.Visit_Province	,data7.Visit_SupId	, data7.Visit_Accompany
,data7.new_coaching_day,data7.call_frequency,data7.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data7. Check_SupPlan ,data7.Check_PlanPeriod,data7.coaching_call1
,data7. CoachingDay 
,data7.CompletetinDate_WO
,data7.CompletetinDate_Rep	
,data7.Check_Complete
,case when data7.Time_Complete =  1 then 1 else NULL end Time_Case_Complete
,data7.Check_Complete * case when data7.Time_Complete =  1 then 1 else NULL end  CompletetionDate  
,Case When ROW_NUMBER() OVER(partition by  data7. Plan_Date,data7.Plan_Period   ORDER BY  data7.Visit_Period   ASC) = 1 then 1 else NULL  end Planner1
,bb.New_amt_coach_day,  bb.New_amt_coach_call,bb.New_amt_plan,bb.New_amt_visit,bb.New_day_exc,bb.New_day_inc,bb.New_target_coach_call,bb.New_target_coach_day
from(
select  data6.new_itinerary_resultid,data6.owner,data6.FormatDate,data6.Plan_Date ,data6.new_date     
,data6.Plan_Period  
,data6.Plan_Time   /*, data6.Plan_Activities*/
,data6.Planner
, data6.Plan_Activities
,data6.Plan_province
,data6.Plan_Territory 
,data6.Plan_Accompany,data6.Visit_Territory
,data6. Visitter
,data6.Visit_Date,data6.Visit_Period ,   data6.Visit_Time ,data6.Visit_Activities	,data6.Visit_Province	,data6.Visit_SupId	, data6.Visit_Accompany
,data6.new_coaching_day,data6.call_frequency,data6.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data6. Check_SupPlan ,data6.Check_PlanPeriod,data6.coaching_call1
,data6. CoachingDay 
,data6.CompletetinDate_WO
,data6.CompletetinDate_Rep	
,case when data6.CompletetinDate_Rep = 0 then  data6.CompletetinDate_WO else data6.CompletetinDate_Rep end Check_Complete
,ROW_NUMBER() OVER(PARTITION BY  data6.visit_period,data6.Plan_Date, data6.Visit_Accompany ORDER BY data6.Plan_period ASC)   Time_Complete
from(
select  data5.new_itinerary_resultid,data5.owner,data5.FormatDate,data5.Plan_Date ,data5.new_date     
,data5.Plan_Period  
,data5.Plan_Time   /*, data5.Plan_Activities*/
,data5.Planner
, data5.Plan_Activities
,data5.Plan_province
,data5.Plan_Territory 
,data5.Plan_Accompany,data5.Visit_Territory
,data5. Visitter
,data5.Visit_Date,data5.Visit_Period ,   data5.Visit_Time ,data5.Visit_Activities	,data5.Visit_Province	,data5.Visit_SupId	, data5.Visit_Accompany
,data5.new_coaching_day,data5.call_frequency,data5.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data5. Check_SupPlan ,data5.Check_PlanPeriod,data5.coaching_call1
,data5. CoachingDay 
,case 
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('2','3','4','5') and data5. Visit_Activities not in(N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE','0Booth') and  data5.call_frequency != ' ' ) then  CONVERT (float,'0.5') 
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('1') and data5. Visit_Activities not in(N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE','0BOOTH') and  data5.call_frequency != ' ' ) then  CONVERT (float,'1.0') 
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('2','3','4','5') and data5. Visit_Activities not in(N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE','0Booth') and  data5.call_frequency = ' ' ) then  CONVERT (float,'0.0') 
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('2','3','4','5') and data5. Visit_Activities  in(N'บจ.ไบโอฟาร์มเคมิคัลส์','0Booth') and  data5.call_frequency = ' ' ) then  CONVERT (float,'0.5')
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('2','3','4','5') and data5. Visit_Activities  in (N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE')  and  data5.call_frequency = ' ' ) then  CONVERT (float,'0.0')
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('1') and data5. Visit_Activities  in (N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE')  and  data5.call_frequency = ' ' ) then  CONVERT (float,'0.0')
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('1') and data5. Visit_Activities  in (N'บจ.ไบโอฟาร์มเคมิคัลส์', 'BOOTH')  /*and  data5.call_frequency IS NULL*/  ) then  CONVERT (float,'1.0')
when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('2','3','4','5') and data5. Visit_Activities  in (N'บจ.ไบโอฟาร์มเคมิคัลส์')  and  data5.call_frequency IS NULL ) then  CONVERT (float,'0.5')
--when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('1') and data5. Visit_Activities  in (N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0BOOTH')  and  data5.call_frequency IS NULL) then  CONVERT (float,'1.0')

when (data5.Visit_Territory ='W/O' and data5.Visit_Time in ('1') and data5. Visit_Activities  in (N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE')  and  data5.call_frequency = ' ' ) then  CONVERT (float,'0.0')
else '' end CompletetinDate_WO
,case 
when (substring (data5.Visit_Territory,1,1) in ('B','U')  and data5.Visit_Time in ('1') and data5. Visit_Activities  not in(N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE','0Booth') and  data5.call_frequency != ' ' ) then  CONVERT (float,'1.0')
when (substring (data5.Visit_Territory,1,1) in ('B','U')  and data5.Visit_Time in (2,3,4,5) and data5. Visit_Activities  not in(N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE','0Booth') and  data5.call_frequency != ' ' ) then  CONVERT (float,'0.5')
else  '' end CompletetinDate_Rep	
from(
select  data4.new_itinerary_resultid,data4.owner,data4.FormatDate,data4.Plan_Date ,data4.new_date     
,data4.Plan_Period  
,data4.Plan_Time   /*, data4.Plan_Activities*/
,data4.Planner
, data4.Plan_Activities
,data4.Plan_province
,data4.Plan_Territory 
,data4.Plan_Accompany,data4.Visit_Territory
,data4. Visitter
,data4.Visit_Date,data4.Visit_Period 
,case when  data4.Visit_Period ='All Day' then  1 
			when data4.Visit_Period ='08.30 - 12.00' then 2
			when data4.Visit_Period  ='12.00 - 16.30' then 3         
			when data4.Visit_Period ='16.30 - 22.30' then 4 
			when data4.Visit_Period  = 'Other' then 5 
			when data4.Visit_Period  IS NULL  then 6  end  AS Visit_Time  
,data4.Visit_Activities	,data4.Visit_Province	,data4.Visit_SupId	, data4.Visit_Accompany
,data4.new_coaching_day,data4.call_frequency,data4.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data4. Check_SupPlan ,data4.Check_PlanPeriod,data4.coaching_call1
,case when  data4.Visitter = 1 and data4.coaching_call1 >= 1 then 1 else NULL end CoachingDay 
from(
select  data3.new_itinerary_resultid,data3.owner,data3.FormatDate,data3.Plan_Date ,data3.new_date     
,case when data3.Plan_Activities is NULL then NULL else data3.Plan_Period end  Plan_Period 
,case when data3.Plan_Activities is NULL then NULL else data3.Plan_Time  end   Plan_Time   /*, data3.Plan_Activities*/
,case when data3. Check_SupPlan IS NULL and  data3.Plan_Activities IS NULL then NULL else   data3.Planner  end  Planner
, data3.Plan_Activities
,data3.Plan_province
,case when data3.Plan_Activities is NULL then NULL else data3.Plan_Territory end Plan_Territory 
,data3.Plan_Accompany,data3.Visit_Territory
,data3. Visitter
,data3.Visit_Date
,data3.Visit_Period,
data3.Visit_Activities	,data3.Visit_Province	,data3.Visit_SupId	, data3.Visit_Accompany
,data3.new_coaching_day,data3.call_frequency,data3.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, data3. Check_SupPlan ,data3.Check_PlanPeriod,i.coaching_call1
from(

select  data2.new_itinerary_resultid,data2.owner,data2.FormatDate,data2.Plan_Date ,data2.new_date     ,data2.Plan_Period,data2.Plan_Time /*, data2.Plan_Activities*/
--,data2.Planner
,case when data2.Visitter = 1   then 1 else NULL end Planner 
, data2.Plan_Activities
,data2.Plan_province,  data2.Plan_Territory
,data2.Plan_Accompany, data2.Visit_Territory
,data2. Visitter
,data2.Visit_Date	,data2.Visit_Period,data2.Visit_Activities	,data2.Visit_Province	,data2.Visit_SupId	, data2.Visit_Accompany
,data2.new_coaching_day,data2.call_frequency,data2.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
, stuff((select distinct ', ' + d.Plan_Accompany 
from TMP_DSM_CallCoaching  d
where d.Plan_Date = data2.Plan_Date
and  d.Visit_SupId = data2.Visit_SupId
and d.territory not in ('SM','DSM')
FOR XML PATH('')),1,1,'')  as Check_SupPlan
, stuff((select distinct ', ' + d.Accompany
from TMP_DSM_CallCoaching  d
where d.Plan_Date = data2.Plan_Date
and  d.Visit_SupId = data2.Visit_SupId
and d.territory not in ('SM','DSM')
FOR XML PATH('')),1,1,'')  as Check_PlanPeriod
from(
select  data1.new_itinerary_resultid,data1.owner,data1.FormatDate,data1.Plan_Date ,data1.new_date     ,data1.Plan_Period,data1.Plan_Time /*, data1.Plan_Activities*/
,data1.Planner
, data1.Plan_Activities
,data1.Plan_province,  data1.Plan_Territory
,data1.Plan_Accompany, data1.Visit_Territory
,data1. Visitter
,data1.Visit_Date	,data1.Visit_Period,data1.Visit_Activities	,data1.Visit_Province	,data1.Visit_SupId	, data1.Visit_Accompany
,data1.new_coaching_day,data1.call_frequency,data1.coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
from(
select  data.new_itinerary_resultid,data.owner,data.FormatDate,data.Plan_Date ,data.new_date     ,data.Plan_Period,data.Plan_Time /*, data.Plan_Activities*/
--,Case When ROW_NUMBER() OVER(partition by  data. Plan_Date,data.Visit_Accompany  ORDER BY  data.Plan_Period,data.Plan_Territory    ASC) = 1 then 1 else NULL  end Planner
,Case When ROW_NUMBER() OVER(partition by  data. Plan_Date,data.Plan_Period,data.Visit_Accompany  ORDER BY  data.Plan_Period,data.Plan_Territory    ASC) = 1 then 1 else NULL  end Planner

, replace (data.  Plan_Activities,'0','') as Plan_Activities
,data.Plan_province,  case when data.Plan_Territory in ('DSM')  then 'W/O' else data.Plan_Territory end Plan_Territory
,data.Plan_Accompany, case when data. Visit_Territory in ('DSM')  then 'W/O' else  data. Visit_Territory   end  Visit_Territory
,Case When ROW_NUMBER() OVER(partition by  data. Plan_Date,data.Visit_Accompany  ORDER BY  data.Plan_Period,data.Plan_Territory    ASC) = 1 then 1 else NULL  end Visitter
,data.Visit_Date	,data.Visit_Period,data.Visit_Time,replace(data.Visit_Activities,'0','') as Visit_Activities	,data.Visit_Province	,data.Visit_SupId	, data.Visit_Accompany
,All_coach.new_coaching_day,All_coach.call_frequency,case when All_coach.coaching_call = 0  then NULL else  All_coach.coaching_call end  coaching_call------->  All Coaching คือ call_frequency,coaching_call,coaching_day
from(
select  tmp1.new_itinerary_resultid,tmp1.owner,tmp1.FormatDate,tmp1.Plan_Date ,tmp1.new_date   ,tmp1.Plan_Period,tmp1.Plan_Time /*, tmp1.Plan_Activities*/
, case when tmp1.  Plan_Territory In ('W/O') then tmp1.Visit_Activities else  tmp1.  Plan_Activities end  Plan_Activities
,tmp1.Plan_province, case when tmp1.Plan_Activities  In  (N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน')  then NULL else  tmp1.Plan_Territory end  Plan_Territory
,tmp1.Plan_Accompany
,case when tmp1.Visit_Activities	In  (N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน')  then NULL else  tmp1.Visit_Territory end Visit_Territory
,tmp1.Visit_Date	,tmp1.Visit_Period,tmp1.Visit_Time,tmp1.Visit_Activities	,tmp1.Visit_Province	,tmp1.Visit_SupId	, tmp1.Visit_Accompany
from(
select  tmp.new_itinerary_resultid,tmp.owner,tmp.FormatDate,tmp.Plan_Date, tmp.new_date,      tmp.Plan_Period,tmp.Plan_Time /*, tmp.Plan_Activities*/
, case when tmp.Plan_Accompany IS NULL and tmp.Visit_Activities not In  (N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน','0BOOTH')  then NULL else  tmp.Plan_Activities end  Plan_Activities
,tmp.Plan_province,tmp.Plan_Territory,tmp.Plan_Accompany
,tmp.Visit_Territory	,tmp.Visit_Date	,tmp.Visit_Period,tmp.Plan_Time as Visit_Time,tmp.Visit_Activities	,tmp.Visit_Province	,tmp.Visit_SupId	, replace (tmp.Visit_Accompany,'  ',' ') as Visit_Accompany
from(
------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 1 : ข้อมูลของ Sales ที่รายการ Add Accompany 1,2,3 รายการที่มีข้อมูลทั้งสองฝั่งทั้ง Plan และ  Visit 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
select tdc2.Owner_List,tdc2.new_itinerary_resultid,tdc2.owner	,tdc2.FormatDate,tdc2.Plan_Date,tdc2.new_date,
tdc2.Plan_Period,tdc2.Plan_Time	,tdc2.Plan_Activities,tdc2.Plan_province, tdc2.Sup_Id,tdc2.Sup_Name,tdc2. Plan_Territory,tdc2.Plan_Accompany
 ,tdc2.Visit_Territory	,tdc2.Visit_Date,tdc2.Visit_Period,tdc2.Visit_Activities,tdc2.Visit_Province
 , tdc2. Visit_SupId 
 ,  tdc2. Visit_Accompany  
from(
select tdc1.Owner_List,tdc1.new_itinerary_resultid,tdc1.owner	,tdc1.FormatDate,tdc1.Plan_Date,tdc1.new_date,
tdc1.Plan_Period,tdc1.Plan_Time	,tdc1.Plan_Activities,tdc1.Plan_province, tdc1.Sup_Id,tdc1.Sup_Name,tdc1. Plan_Territory,tdc1.Plan_Accompany
 ,tdc1.Visit_Territory	,tdc1.Visit_Date,tdc1.Visit_Period,tdc1.Visit_Activities,tdc1.Visit_Province
 , case when tdc1.Visit_SupId IS NULL then  tdc1.Sup_Id else   tdc1.Visit_SupId end Visit_SupId 
 , case when tdc1.Visit_Accompany  IS NULL then  tdc1.Sup_Name else   tdc1.Visit_Accompany end Visit_Accompany  
from(
select tdc.Owner_List,tdc.new_itinerary_resultid,tdc.owner	,tdc.PlanDate	 as FormatDate,tdc.Plan_Date,tdc.new_date,
tdc.Plan_Period,tdc.Plan_Time	,tdc.Plan_Activities,tdc.P_Provice as Plan_province, tdc.Sup_Id,tdc.Sup_Name,tdc.territory as Plan_Territory,tdc.Plan_Accompany
 ,tdc.Visit_Territory	,tdc.Visit_Date,tdc.Visit_Period,tdc.Visit_Activities,tdc.V_Provice as Visit_Province, tdc.Visit_SupId,    tdc.Accompany as Visit_Accompany 
from  TMP_DSM_CallCoaching  tdc
where 1=1
and YEAR(tdc.new_date) = YEAR(GETDATE())
and RIGHT(CONVERT(VARCHAR(7),tdc.new_date, 20), 5)  in ('20-09')
and tdc.Sup_Id  in ('1AE057E8-72CD-E611-8209-005056A776FC','9205323D-E31C-E311-A54A-BC305BE19597','0F64FC29-F51C-E311-A54A-BC305BE19597','516A6243-677B-E811-989F-005056A776FC','E2216506-E41C-E311-A54A-BC305BE19597','A351801C-E61C-E311-A54A-BC305BE19597','88DDC13D-062D-EA11-AA70-005056A776FC')
and tdc.Owner_List in('Accompany1','Accompany2','Accompany3')
) tdc1
) tdc2 where 1=1 and tdc2.Plan_Accompany = tdc2.Visit_Accompany
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 1 : ข้อมูลของ Sales ที่รายการ Add Accompany 1,2,3 รายการที่มีข้อมูลทั้งสองฝั่งทั้ง Plan และ  Visit 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
union 

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 2 : ข้อมูลของ DSM ที่เป็นรายการวันหยุด  - N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน'
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--select tdc.Owner_List,tdc.new_itinerary_resultid,tdc.owner	,tdc.PlanDate	 as FormatDate,tdc.Plan_Date,tdc.new_date,
--tdc.Plan_Period,tdc.Plan_Time	,tdc.Plan_Activities,tdc.P_Provice as Plan_province, tdc.Sup_Id,tdc.Sup_Name      ,tdc.territory as Plan_Territory,tdc.Plan_Accompany
-- ,tdc.Visit_Territory	,tdc.Visit_Date
-- ,case when tdc.Visit_Period IS NULL then tdc.Plan_Period else tdc.Visit_Period end Visit_Period
-- ,tdc.Visit_Activities,tdc.V_Provice as Visit_Province, tdc.Visit_SupId,    
--case when  tdc.Accompany IS NULL  then tdc.Sup_Name else  tdc.Accompany end  Visit_Accompany 
--from  TMP_DSM_CallCoaching  tdc
--where 1=1
--and YEAR(tdc.new_date) = YEAR(GETDATE())
--and RIGHT(CONVERT(VARCHAR(7),tdc.new_date, 20), 5)  in ('20-09')
--and  TDC.Visit_Activities  in (N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน')
--and tdc.Sup_Id  in ('1AE057E8-72CD-E611-8209-005056A776FC','9205323D-E31C-E311-A54A-BC305BE19597','0F64FC29-F51C-E311-A54A-BC305BE19597','516A6243-677B-E811-989F-005056A776FC','E2216506-E41C-E311-A54A-BC305BE19597','A351801C-E61C-E311-A54A-BC305BE19597','88DDC13D-062D-EA11-AA70-005056A776FC')
--and tdc.Visit_Territory  in ('SM','DSM')
select tdcx.Owner_List,tdcx.new_itinerary_resultid,tdcx.owner	,tdcx. FormatDate,tdcx.Plan_Date,tdcx.new_date,
tdcx.Plan_Period,tdcx.Plan_Time	,tdcx.Plan_Activities,tdcx.Plan_province, tdcx.Sup_Id,tdcx.Sup_Name      ,tdcx.Plan_Territory,tdcx.Plan_Accompany
,case when tdcx.Visit_Territory	IS NULL then tdcx.Plan_Territory else tdcx.Visit_Territory end Visit_Territory
,tdcx.Visit_Date,tdcx.Visit_Period
,case when tdcx.Visit_Activities IS NULL then tdcx.Plan_Activities else  tdcx.Visit_Activities end Visit_Activities
,case when tdcx. Visit_Province IS NULL then tdcx.Plan_province else tdcx. Visit_Province end Visit_Province 
,case when tdcx.Visit_SupId IS NULL then tdcx.Sup_Id else  tdcx.Visit_SupId end Visit_SupId
,tdcx.  Visit_Accompany 
from ( 
select tdc.Owner_List,tdc.new_itinerary_resultid,tdc.owner	,tdc.PlanDate	 as FormatDate,tdc.Plan_Date,tdc.new_date,
tdc.Plan_Period,tdc.Plan_Time	,tdc.Plan_Activities,tdc.P_Provice as Plan_province, tdc.Sup_Id,tdc.Sup_Name      ,tdc.territory as Plan_Territory,tdc.Plan_Accompany
 ,tdc.Visit_Territory	,tdc.Visit_Date
 ,case when tdc.Visit_Period IS NULL then tdc.Plan_Period else tdc.Visit_Period end Visit_Period
 ,tdc.Visit_Activities,tdc.V_Provice as Visit_Province, tdc.Visit_SupId,    
case when  tdc.Accompany IS NULL  then tdc.Sup_Name else  tdc.Accompany end  Visit_Accompany 
from  TMP_DSM_CallCoaching  tdc
where 1=1
and YEAR(tdc.new_date) = YEAR(GETDATE())
and RIGHT(CONVERT(VARCHAR(7),tdc.new_date, 20), 5)  in ('20-09')
and  TDC.Plan_Activities  in (N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน','0BOOTH')
and tdc.Sup_Id  in('1AE057E8-72CD-E611-8209-005056A776FC','9205323D-E31C-E311-A54A-BC305BE19597','0F64FC29-F51C-E311-A54A-BC305BE19597','516A6243-677B-E811-989F-005056A776FC','E2216506-E41C-E311-A54A-BC305BE19597','A351801C-E61C-E311-A54A-BC305BE19597','88DDC13D-062D-EA11-AA70-005056A776FC')
)tdcx 
where 1=1 
and  tdcx.Plan_Territory in ('SM','DSM')
and tdcx.Visit_Date is not null 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 2 : ข้อมูลของ DSM ที่เป็นรายการวันหยุด  - N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน'
---------------------------------------------------------------------------------------------------------------------------------------------------------------
UNION 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 3 : ข้อมูลของ DSM ที่เป็นรายการการทำงาน ในแต่ละ วันที่เป็นรายการของตัวเอง - W/O
---------------------------------------------------------------------------------------------------------------------------------------------------------------
select tdc.Owner_List,tdc.new_itinerary_resultid,tdc.owner	,tdc.PlanDate	 as FormatDate,tdc.Plan_Date,tdc.new_date
,tdc.Plan_Period,tdc.Plan_Time	,tdc.Plan_Activities,tdc.P_Provice as Plan_province, tdc.Sup_Id,tdc.Sup_Name  
, case when tdc.Plan_Activities   In   (N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน') then NULL  else  'W/O' end    Plan_Territory
,tdc.Plan_Accompany
 ,case when  tdc.Visit_Activities   In (N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน') then NULL  else  'W/O'  end  Visit_Territory
,tdc.Visit_Date
,case when tdc.Visit_Period IS NULL then  tdc.Plan_Period  else  tdc.Visit_Period  end Visit_Period
,tdc.Visit_Activities,tdc.V_Provice as Visit_Province , tdc.Visit_SupId
,case when  tdc.Accompany IS NULL  then tdc.Sup_Name else  tdc.Accompany end  Visit_Accompany 
from  TMP_DSM_CallCoaching  tdc     
where 1=1
and YEAR(tdc.new_date) = YEAR(GETDATE())
and RIGHT(CONVERT(VARCHAR(7),tdc.new_date, 20), 5)  in ('20-09')
and  TDC.Plan_Activities  not in (N'บจ.ไบโอฟาร์มเคมิคัลส์',N'0เดินทาง',N'0HOLIDAY',N'0SAT',N'0SUN',N'0LEAVE',N'ลาพักร้อน','0BOOTH')
and tdc.Sup_Id  in ('1AE057E8-72CD-E611-8209-005056A776FC','9205323D-E31C-E311-A54A-BC305BE19597','0F64FC29-F51C-E311-A54A-BC305BE19597','516A6243-677B-E811-989F-005056A776FC','E2216506-E41C-E311-A54A-BC305BE19597','A351801C-E61C-E311-A54A-BC305BE19597','88DDC13D-062D-EA11-AA70-005056A776FC') 
and tdc.Visit_Territory  in ('SM','DSM')
and TDC.Visit_Activities is not null 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 3 : ข้อมูลของ DSM ที่เป็นรายการการทำงาน ในแต่ละ วันที่เป็นรายการของตัวเอง - W/O
---------------------------------------------------------------------------------------------------------------------------------------------------------------
UNION
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 4 : ข้อมูลของ Sales ที่รายการ Add Accompany  แค่ฝั่ง visit แต่ไม่ได้มีการ  Add Accompany ตอนการทำ Plan 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
select data_emp.Owner_List,data_emp.new_itinerary_resultid,data_emp.owner	,data_emp. FormatDate,data_emp.Plan_Date,data_emp.new_date,
data_emp.Plan_Period,data_emp.Plan_Time	,data_emp.Plan_Activities,data_emp.Plan_province , data_emp.Sup_Id,data_emp.Sup_Name ,data_emp.Plan_Territory,data_emp.Plan_Accompany
 ,data_emp.Visit_Territory	,data_emp.Visit_Date,data_emp.Visit_Period,data_emp.Visit_Activities,data_emp.Visit_Province,data_emp.salesrep_id,data_emp.salesrep_name  
from 
(
select data.Owner_List,data.new_itinerary_resultid,data.owner	,data. FormatDate,data.Plan_Date,data.new_date,
data.Plan_Period,data.Plan_Time	,data.Plan_Activities,data.Plan_province , data.Sup_Id,data.Sup_Name ,data.Plan_Territory,data.Plan_Accompany
,data.Visit_Territory	,data.Visit_Date,data.Visit_Period,data.Visit_Activities,data.Visit_Province, data.Visit_SupId, data. Visit_Accompany 
,emp.salesrep_id,emp.salesrep_name  
from 
( 
select tdcx.Owner_List,tdcx.new_itinerary_resultid,tdcx.owner	,tdcx. FormatDate,tdcx.Plan_Date,tdcx.new_date,
tdcx.Plan_Period,tdcx.Plan_Time	,tdcx.Plan_Activities,tdcx.Plan_province , tdcx.Sup_Id,tdcx.Sup_Name ,tdcx.Plan_Territory,tdcx.Plan_Accompany
 ,tdcx.Visit_Territory	,tdcx.Visit_Date,tdcx.Visit_Period,tdcx.Visit_Activities,tdcx.Visit_Province, tdcx.Visit_SupId, tdcx. Visit_Accompany 
from 
( 
select tdc.Owner_List,tdc.new_itinerary_resultid,tdc.owner	,tdc.PlanDate	 as FormatDate,tdc.Plan_Date,tdc.new_date,
tdc.Plan_Period,tdc.Plan_Time	,tdc.Plan_Activities,tdc.P_Provice as Plan_province , tdc.Sup_Id,tdc.Sup_Name ,tdc.territory as Plan_Territory,tdc.Plan_Accompany
 ,tdc.Visit_Territory	,tdc.Visit_Date,tdc.Visit_Period,tdc.Visit_Activities,tdc.V_Provice as Visit_Province, tdc.Visit_SupId, tdc.Accompany as Visit_Accompany 
from  TMP_DSM_CallCoaching  tdc
where 1=1
and YEAR(tdc.new_date) = YEAR(GETDATE())
and RIGHT(CONVERT(VARCHAR(7),tdc.new_date, 20), 5)  in ('20-09')
and tdc. Accompany is not null 
) tdcx where 1=1
)data
left join
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
)emp on data.Visit_Accompany = REPLACE(emp.salesrep_name,'  ',' ') 
)data_emp
where 1=1
and data_emp.salesrep_id in ('1AE057E8-72CD-E611-8209-005056A776FC','9205323D-E31C-E311-A54A-BC305BE19597','0F64FC29-F51C-E311-A54A-BC305BE19597','516A6243-677B-E811-989F-005056A776FC','E2216506-E41C-E311-A54A-BC305BE19597','A351801C-E61C-E311-A54A-BC305BE19597','88DDC13D-062D-EA11-AA70-005056A776FC')
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data 4 : ข้อมูลของ Sales ที่รายการ Add Accompany  แค่ฝั่ง visit แต่ไม่ได้มีการ  Add Accompany ตอนการทำ Plan 
---------------------------------------------------------------------------------------------------------------------------------------------------------------
)tmp
)tmp1
group by  tmp1.new_itinerary_resultid,tmp1.owner,tmp1.FormatDate,tmp1.Plan_Date,tmp1.Plan_Period,tmp1.Plan_Time /*, tmp1.Plan_Activities*/
, tmp1.  Plan_Activities,tmp1.new_date
,tmp1.Plan_province,tmp1.Plan_Territory,tmp1.Plan_Accompany
,tmp1.Visit_Territory	,tmp1.Visit_Date	,tmp1.Visit_Period,tmp1. Visit_Time,tmp1.Visit_Activities	,tmp1.Visit_Province	,tmp1.Visit_SupId	, tmp1.Visit_Accompany
)data
Left Join  --> Join ข้อมูลทั้งหมดใน Tab Hide
(
select cc.new_itinerary_resultid,cc.new_date, cc.Period_Time,cc.new_coaching_day,cc.new_call_frequency_all as  call_frequency , cc.new_coaching_call_all as coaching_call
from
( select  itr.new_itinerary_resultid,new_coaching_day , new_call_frequency_all ,new_coaching_call_all, 'All Day' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid,new_coaching_day  , new_call_frequency_mor ,new_coaching_call_mor, '08.30 - 12.00' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid,new_coaching_day  , new_call_frequency_noon ,new_coaching_call_noon , '12.00 - 16.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid,new_coaching_day  , new_call_frequency_evening ,new_coaching_call_evening , '16.30 - 22.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in('20-09') 
union 
select  itr.new_itinerary_resultid,new_coaching_day  , new_call_frequency_other ,new_coaching_call_other , 'Other' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
)cc
)All_coach on data.new_itinerary_resultid = All_coach.new_itinerary_resultid and data.new_date= All_coach.new_date and data.Visit_Period = All_coach.Period_Time
)data1
)data2
)data3
LEFT JOIN 
(
select i.new_result_all_ref1id ,i.new_date,sum(i.coaching_call) as coaching_call1
from (
select cc.new_itinerary_resultid, cc.new_result_all_ref1id  ,  CONVERT(VARCHAR(11), cc.new_date , 106)  as new_date, cc.new_coaching_call_all as coaching_call
from
( select  itr.new_itinerary_resultid,itr.new_result_all_ref1id     ,new_coaching_day  , new_call_frequency_all ,new_coaching_call_all, 'All Day' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid ,itr.new_result_mor_ref1id   ,new_coaching_day , new_call_frequency_mor ,new_coaching_call_mor, '08.30 - 12.00' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_noon_ref1id  ,new_coaching_day  , new_call_frequency_noon ,new_coaching_call_noon , '12.00 - 16.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_even_ref1id,new_coaching_day  , new_call_frequency_evening ,new_coaching_call_evening , '16.30 - 22.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_other_ref1id,new_coaching_day  , new_call_frequency_other ,new_coaching_call_other , 'Other' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
)cc
union 
select cc.new_itinerary_resultid, cc.new_result_all_ref2id  ,  CONVERT(VARCHAR(11), cc.new_date , 106)  as new_date, cc.new_coaching_call_all as coaching_call
from
( select  itr.new_itinerary_resultid,itr.new_result_all_ref2id     ,new_coaching_day  , new_call_frequency_all ,new_coaching_call_all, 'All Day' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
union 
select  itr.new_itinerary_resultid ,itr.new_result_mor_ref2id   ,new_coaching_day , new_call_frequency_mor ,new_coaching_call_mor, '08.30 - 12.00' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_noon_ref2id  ,new_coaching_day  , new_call_frequency_noon ,new_coaching_call_noon , '12.00 - 16.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_even_ref2id,new_coaching_day  , new_call_frequency_evening ,new_coaching_call_evening , '16.30 - 22.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_other_ref2id,new_coaching_day  , new_call_frequency_other ,new_coaching_call_other , 'Other' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
)cc
union

select cc.new_itinerary_resultid, cc.new_result_all_ref3id  ,  CONVERT(VARCHAR(11), cc.new_date , 106)  as new_date, cc.new_coaching_call_all as coaching_call
from
( select  itr.new_itinerary_resultid,itr.new_result_all_ref3id     ,new_coaching_day  , new_call_frequency_all ,new_coaching_call_all, 'All Day' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
union 
select  itr.new_itinerary_resultid ,itr.new_result_mor_ref3id   ,new_coaching_day , new_call_frequency_mor ,new_coaching_call_mor, '08.30 - 12.00' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_noon_ref3id  ,new_coaching_day  , new_call_frequency_noon ,new_coaching_call_noon , '12.00 - 16.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_even_ref3id,new_coaching_day  , new_call_frequency_evening ,new_coaching_call_evening , '16.30 - 22.30' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in  ('20-09')
union 
select  itr.new_itinerary_resultid  ,itr.new_result_other_ref3id,new_coaching_day  , new_call_frequency_other ,new_coaching_call_other , 'Other' as Period_Time,itr.new_date
from FilteredNew_itinerary_result  itr
where 1=1 
and itr.statecode = 0 and itr.statuscode = 1
and  RIGHT(CONVERT(VARCHAR(7),itr.new_date, 20), 5)  in ('20-09')
)cc
)i
where 1=1
and i.new_result_all_ref1id is not null 
group by  i.new_result_all_ref1id ,i.new_date
)  i on data3.Visit_SupId = i.new_result_all_ref1id and data3.Plan_Date=i.new_date
)data4
)data5
)data6
)data7
LEFT JOIN 
(
select REPLACE(wk.new_name,'  ',' ') as name,wk.New_amt_coach_call,wk.New_amt_coach_day,wk.New_amt_plan,wk.New_amt_visit
,wk.New_day_exc,wk.New_day_inc,wk.New_target_coach_call,wk.New_target_coach_day
from FilteredNew_working_day2  wk
where 1=1
--and YEAR(wk.New_period) = '2020'
--and month(wk.New_period ) = '5'
and RIGHT(CONVERT(VARCHAR(7),wk.New_period, 20), 5) in  ('20-09')
and SUBSTRING(wk.new_name,1,1) not in ('B','U','W')
)bb on data7.Visit_Accompany  = bb.name
)data8
Left  join 
(
select sup.sup_id,sup_name,sm_id,sm_name
from(
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
              )sup  where 1=1 and sup.sup_id is not null 
              group by sup.sup_id,sup_name,sm_id,sm_name  
) emp on data8.Visit_Accompany = replace(emp.sup_name,'  ',' ')
where 1=1
and data8.Visit_SupId like '%' -- in (@Sup)
)data9
where 1=1 
)data10
where data10.sm_name not in (N'บุญสม  เกษจันทร์ทิวา') 
-----********xxxxx*******----------
