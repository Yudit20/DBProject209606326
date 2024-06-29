select pharmacy.storeid , pharmacy.storename 
from pharmacy
JOIN bill ON pharmacy.storeid=bill.storeid
where bill.price < (select  AVG(bill.price) as averageprice
                    from patient 
                    JOIN bill ON patient.pid=bill.pid
                    where patient.dateofbrith>add_months(sysdate, -12*18));

select patient.patient_name as names
from patient 
JOIN bill ON patient.pid=bill.pid
where bill.price < (select COUNT(*) 
                    from bill 
                    where bill.price > (select AVG(bill.price)from bill));

 

select e.name
from employee e
JOIN pharmacy p ON e.storeid=p.storeid
where p.city= 'Los Angele' and ROWNUM=1
order by e.salary DESC;

select employee.name
from employee
where employee.salary>
                   (select COUNT(*) AS number_of_medicine
                    from medicine m
                    where m.price >(SELECT AVG(price) FROM medicine) 
                              AND m.quantity<(select AVG(quantity)from medicine));

update bill b
set price=0
where b.bnumber in(
                    select bi.bnumber
                      from  bill bi
                  JOIN patient ON bi.pid=patient.pid
                  where TO_CHAR(bi.dateofbill,'MM-DD')=TO_CHAR(patient.dateofbrith,'MM-DD')
                 );
                
update bill b
set price=price/2
where b.bnumber in(
                   select b.bnumber
                   from bill b 
                   where b.pid =(
                                  select employee.eid
                                   from employee
                                   Join patient on employee.eid=patient.pid)) ;

delete from bill
where bill.bnumber in(
                      select b.bnumber
                      from bill b
                      where b.price in(select MIN(price)
                                        from medicine 
));
  delete from supplier
  where supplier.sid in (
                      select s.sid
                      from supplier s
               JOIN pharmacy p ON s.name=p.storename Join pharmacy p ON s.city=p.city;
