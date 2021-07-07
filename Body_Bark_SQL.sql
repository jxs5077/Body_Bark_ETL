-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/t73FZf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

Drop table "Ordered_Items";
Drop table "Boutiques";
Drop table "Top_Boutiques";
Drop table "Internet_Order";
Drop table "Product_List";
Drop table "Internet_Customers";

CREATE TABLE "Internet_Customers" (
    "customer_id" int,
    "city" varchar,
    "state" varchar,
    "zip" varchar,
    CONSTRAINT "pk_Internet_Customers" PRIMARY KEY (
        "customer_id"
     )
);

CREATE TABLE "Product_List" (
    "sku" varchar,
    "description" varchar,
    "product_num" varchar,
    "product_color" varchar,
    "product_size" varchar,
    CONSTRAINT "pk_Product_List" PRIMARY KEY (
        "sku"
     )
);
drop table "Internet_Order" CASCADE;
CREATE TABLE "Internet_Order" (
    "order_id" varchar,
    "customer_id" int,
    "order_date" varchar,
    "month" int,
    "order_status" varchar,
    "sub_total" float,
    "order_total" float,
    "total_quantity" int,
    "coupon" boolean,
    CONSTRAINT "pk_Internet_Order" PRIMARY KEY (
        "order_id"
     )
);

drop table "Top_Boutiques" CASCADE;
CREATE TABLE "Top_Boutiques" (
    "boutique_id" int,
    "boutique_name" varchar,
    "ranking" int
);

CREATE TABLE "Boutiques" (
    "boutique_id" int,
    "boutique_name" varchar,
    "street_address" varchar,
    "city" varchar,
    "state" varchar,
    "zip" varchar,
    CONSTRAINT "pk_Boutiques" PRIMARY KEY (
        "boutique_id"
     )
);

drop table "Product_List" CASCADE
select * from "Internet_Order"

drop table "Ordered_Items";
CREATE TABLE "Ordered_Items" (
    "order_id" varchar,
    "total_each_sku" int,
    "sku" varchar,
    "product_unit_price" float,
    CONSTRAINT "pk_Ordered_Items" PRIMARY KEY (
        "order_id","sku"
     )
);

ALTER TABLE "Top_Boutiques" ADD CONSTRAINT "fk_Boutiques_boutique_id" FOREIGN KEY("boutique_id")
REFERENCES "Boutiques" ("boutique_id");

ALTER TABLE "Internet_Order" ADD CONSTRAINT "fk_Internet_Order_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Internet_Customers" ("customer_id");


ALTER TABLE "Ordered_Items" ADD CONSTRAINT "fk_Ordered_Items_sku" FOREIGN KEY("sku")
REFERENCES "Product_List" ("sku");

ALTER TABLE "Ordered_Items" ADD CONSTRAINT "fk_Ordered_Items_order_id" FOREIGN KEY("order_id")
REFERENCES "Internet_Order" ("order_id");

select * from "Internet_Order";
select * from "Internet_Customers";
select * from "Ordered_Items";
select * from "Product_List";
select * from "Top_Boutiques";