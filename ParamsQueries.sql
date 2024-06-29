select pharmacy.storeid , pharmacy.storename 
from pharmacy
JOIN bill ON pharmacy.storeid=bill.storeid
where bill.price < (select  AVG(bill.price) as averageprice
                    from patient 
                    JOIN bill ON patient.pid=bill.pid
                    where to_date( patient.dateofbrith,'dd-mm-yyyy')> to_date(&d_to, 'dd-mm-yyyy'));

select employee.name
from employee
where employee.salary>
                   (select COUNT(*) AS number_of_medicine
                    from medicine m
                    where m.price >&<name="price" list="134,879,888">
                              AND m.quantity<&<name="quantity" required=true>);

select patient.patient_name as names
from patient 
JOIN bill ON patient.pid=bill.pid
where bill.price < (select COUNT(*) 
                    from bill 
                    where bill.price >&<name="price value" 
                     hint="price value between 100 and 1000" >);

select e.name
from employee e
JOIN pharmacy p ON e.storeid=p.storeid
where p.city= &<name="mycity" type="string" default="Los Angele"> and ROWNUM=1
order by e.salary DESC;
