CREATE TABLE "Staging"."Invoices"
(
	id_invoice INT PRIMARY KEY,
	issuedDate DATE,
	country VARCHAR(60),
	service VARCHAR(100),
	total DECIMAL(10,2),
	discount DECIMAL(10,2),
	tax DECIMAL(10,2),
	invoiceStatus VARCHAR(10),	
	balance	DECIMAL(10,2),
	dueDate	DATE,
	client VARCHAR(10),
	lastUpdateDate	DATE
);