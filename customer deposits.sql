create table cb_customer_deposits
(id number  generated always  as identity primary key,
customer_id number,
deposit_product_id number,
contract_no varchar2(30),
deposit_amout number(22,2),
profit_amout number(22,2),
start_date date);


create or replace procedure cb_customer_deposits_insert 
(p_customer_id number,p_deposit_product_id number,p_contract_no varchar2,p_deposit_amout number,p_profit_amout number,p_start_date date) is
begin
insert into cb_customer_deposits (customer_id,deposit_product_id,contract_no,deposit_amout,profit_amout,start_date) 
values 
(p_customer_id,p_deposit_product_id,p_contract_no,p_deposit_amout,p_profit_amout,p_start_date);
commit;
end;


create or replace procedure cb_customer_deposits_update 
(p_id number,p_customer_id number default null,p_deposit_product_id number default null,p_contract_no varchar2 default null,
p_deposit_amout number default null,p_profit_amout number,p_start_date date default null) is
begin
update cb_customer_deposits set
customer_id=nvl(p_customer_id,customer_id),
deposit_product_id=nvl(p_deposit_product_id,deposit_product_id),
contract_no=nvl(p_contract_no,contract_no),
deposit_amout=nvl(p_deposit_amout,deposit_amout),
profit_amout=nvl(p_profit_amout,profit_amout),
start_date=nvl(p_start_date,start_date)
where id=p_id;
commit;
end;

