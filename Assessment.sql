create table Items (
item_code NUMBER(6)PRIMARY KEY,
item_name VARCHAR(50),
entry_date  DATE,
item_qty INT DEFAULT 10 CHECK(item_qty >= 10)
);



CREATE TABLE Salessa (
    SALES_SER NUMBER(6) PRIMARY KEY,
    SALE_DATE DATE,
    item_code NUMBER(30), 
    SALE_QTY NUMBER(30),
    customer_code NUMBER(6), 
    item_price NUMBER(10,2),
    SALES_AMOUNT NUMBER(12,2),
    CONSTRAINT FK_Sales_Items FOREIGN KEY (item_code) REFERENCES Items (item_code), 
    CONSTRAINT FK_Sales_Customers FOREIGN KEY (customer_code) REFERENCES Customers (customer_code) 
);



create table Customers (
customer_code Number (6)PRIMARY KEY,
customer_name VARCHAR (50),
address VARCHAR (200),
tel NUMBER(30)
);

CREATE TABLE Returnsss (
    return_ser NUMBER(30) PRIMARY KEY,
    return_date DATE,
    sales_ser NUMBER(30),
    return_qty NUMBER(30),
    CONSTRAINT FK_Returns_Sales FOREIGN KEY (sales_ser) REFERENCES Salesss (sales_ser)
);

CREATE TABLE Invoiceee (
    invoice_ser NUMBER(30) PRIMARY KEY,
    invoice_date DATE,
    sales_ser NUMBER(30),
    amount NUMBER(12,2),
    CONSTRAINT FK_Invoice_Sales FOREIGN KEY (sales_ser) REFERENCES Salesss (sales_ser)
);

    
CREATE SEQUENCE sal_sales_ser 
                Start WITH 1
                INCREMENT BY 6
                MAXVALUE 1000
                NOCACHE;

CREATE SEQUENCE ite_item_qty
                START WITH 10
                MAXVALUE 25
                NOCACHE;

CREATE OR REPLACE TRIGGER trg_BeforeInsert_Invoiceee
BEFORE INSERT ON INVOICEEE
FOR EACH ROW
DECLARE
    v_max_INVOICE_SER NUMBER;
    v_SALE_DATE DATE;
BEGIN
    
    SELECT NVL(MAX(INVOICE_SER), 0) INTO v_max_INVOICE_SER FROM INVOICEEE;


    
    SELECT SALE_DATE INTO v_SALE_DATE FROM SALESS WHERE SALES_SER = :NEW.SALES_SER;

    
    IF :NEW.INVOICE_DATE <= v_SALE_DATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invoice date must be greater than sale date.');
    END IF;
END;
/       


create or replace TRIGGER trg_check_item_qty
AFTER INSERT ON Saless
for EACH ROW
DECLARE 
    V_item_qty NUMBER;
BEGIN
    select ITEM_QTY INTO V_item_qty
    From Items
    where item_code = :NEW.item_code;
    
    IF V_item_qty < :NEW.sale_qty then
        RAISE_APPLICATION_ERROR(-20001, 'We do not have enough quantity of this item');
    ELSE 
        UPDATE Items
        SET ITEM_QTY = ITEM_QTY - :NEW.sale_qty
        where item_code = :NEW.item_code;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND then
        RAISE_APPLICATION_ERROR(-20001, 'item_code can not fount in Items');
END;
/
    


INSERT INTO Items (item_code, item_name, entry_date, item_qty)
            VALUES
            (123,'product',TO_DATE('10/11/2024','DD/MM/YYYY'), 12);
            


CREATE OR REPLACE TRIGGER trg_BEFOREINSERT_Saless
BEFORE INSERT ON Saless
FOR EACH ROW
DECLARE
   
BEGIN
    
    IF :NEW.sale_date <= sysdate THEN 
        RAISE_APPLICATION_ERROR(-2001, 'sale_date Must be greater Than This date');
    END IF;
    
END;
/


select * from items;

create or REPLACE PROCEDURE UPDATE_ITEMS (
P_item_code IN NUMBER,
P_item_name IN VARCHAR,
P_entry_date IN DATE,
P_item_qty IN NUMBER
)AS 
    V_count NUMBER;
BEGIN
    select COUNT (*)
    INTO V_count
    From items
    WHERE item_code = P_item_code;
    
    IF V_count = 0 then
        INSERT INTO Items (item_code, item_name, entry_date, item_qty)
        VALUES (P_item_code, P_item_name, P_entry_date, P_item_qty);
    ELSE
        UPDATE Items
        SET item_qty = P_item_qty,
            entry_date = P_entry_date
        WHERE item_code = P_item_code;
    END IF;
END;
/
BEGIN
    UPDATE_Items(
        P_item_code => 453,
        P_item_name => 'Sample Item',
        P_entry_date => SYSDATE ,
        P_item_qty => 20
    );
END;
/



INSERT INTO Saless (SALES_SER, SALE_DATE, ITEM_CODE, SALE_QTY, CUSTOMER_CODE, ITEM_PRICE,SALES_AMOUNT)
            VALUES
            (123, SYSDATE , '453', 5, 789, 100, 500);




INSERT INTO Customers (customer_code, customer_name, address)
            VALUES
            (789, 'ali', '123Street a');
            


      
INSERT INTO RETURNSSS (RETURN_SER, RETURN_DATE, SALES_SER, RETURN_QTY)
            VALUES
            (1011, SYSDATE, 123, 25);

INSERT INTO INVOICEEE (INVOICE_SER, INVOICE_DATE, SALES_SER, AMOUNT)
            VALUES
            (876, SYSDATE +1, 123, 20);

select *from  RETURNSSS;                 
select *from INVOICEEE;
select *from Customers;



SELECT SALES_SER, SALE_DATE, ITEM_CODE, SALE_QTY, CUSTOMER_CODE, ITEM_PRICE, (SALE_QTY * ITEM_PRICE) AS sales_amount
FROM SALESS;






            
            
select e.SALES_SER, e.ITEM_CODE, SALE_DATE, ENTRY_DATE, ITEM_QTY, d.ITEM_CODE
FROM SALESS e JOIN Items d
ON (e.ITEM_CODE = d.ITEM_CODE);


--select e.return_ser, e.sales_ser, return_date, sale_date, d.return_ser, d.sales_ser
--from Returnssss e JOIN Salesss d
--ON (e.sales_ser = d.sales_ser); --



 SELECT  i.ITEM_CODE, s.SALE_QTY , r.RETURN_QTY, i.ITEM_QTY
    FROM    SALESS s join RETURNSSS r
    ON (s.SALES_SER = r.SALES_SER)
    JOIN ITEMS i
    ON (i.ITEM_CODE = s.ITEM_CODE);
    
    


CREATE VIEW 	empvu81
 AS SELECT  customer_name, sale_qty, sale_itemm, e.customer_code, e.sales_code, return_ser,return_item, return_qty,d.customer_code
    FROM    Salesss e JOIN Customerss d
    ON (e.customer_code = d.customer_code)
    JOIN Returnssss l
    ON (d.customer = l.return_ser);
