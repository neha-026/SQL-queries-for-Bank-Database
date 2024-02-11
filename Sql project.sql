## Write a query in Sql to find out how many active customers have their Debit card status as "Inactive"

select a.customer_ID,a.account_no,a.name,a.city,a.age,a.branch,a.acc_type,a.acc_status, b.debit_card_status from 
sbi_customers A,debit_card B where A.customer_id=b.cust_ID and a.acc_status='Active' and b.debit_card_status="Inactive";

## Write a query in Sql to find out how many inactive customers have  Debit card status as "Active" and using the mobile application of bank

select a.customer_ID,a.account_no,a.name,a.city,a.age,a.branch,a.acc_type,a.acc_status, b.debit_card_status,c.Bank_app_usage from
sbi_customers A, debit_card B,app_usage C where a.Customer_id=b.Cust_id and b.Cust_id=c.Ct_id and a.acc_status="Closed" 
and b.debit_card_status="Active" and c.bank_app_usage="Yes";

## Write an SQl query to find the customer whose account balance is more than the average balance of all customers 
## with debit card status as inactive and type=Silver

select avg(acc_balance) from sbi_customers A;

select a.customer_ID,a.account_no,a.name,a.city,a.age,a.branch,a.acc_type,a.acc_status,a.acc_balance,b.debit_card_status,b.debit_card_type
from sbi_customers A, debit_card B where a.customer_ID=b.cust_id and acc_balance>=(select avg(acc_balance) from sbi_customers A) 
and b.debit_card_Status="Inactive" and b.debit_card_type="Silver";


## Create stored procedure with two queries
##1. To fetch all the records in which the name of customer starts with "G" and the branch code is 20563
## 2. To fetch all records from sbi_customers whose age is between 25 to 35

call Procedure_1;

##Write an sql query to find the second highest account balance of customer living in Thane and using the mobile application

select a.customer_ID,a.account_no,a.name,a.city,a.branch,a.acc_type,a.acc_status,a.acc_balance,b.Bank_app_usage from sbi_customers A,app_usage B where 
a.customer_ID=b.ct_id and a.acc_balance=(select max(acc_balance) from sbi_customers A where acc_balance!=(select max(acc_balance) 
from sbi_customers A where city="Thane") and city="Thane") and b.Bank_app_usage="Yes";

## Write an SQL query to find the citywise count of customers who are using mobile app and debit card

select count(a.name) as no_of_customers,a.city from sbi_customers A,debit_card B, app_usage C where a.customer_ID=b.cust_ID and b.cust_ID=c.ct_ID and
b.debit_card_status="Active" and c.bank_app_usage="Yes" group by a.city;

