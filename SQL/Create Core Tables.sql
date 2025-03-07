CREATE TABLE "Core"."DimClient" (
    client_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    clientName VARCHAR(255)
);

CREATE TABLE "Core"."DimCountry" (
    country_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    countryName VARCHAR(255)
);

CREATE TABLE "Core"."DimService" (
    service_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    serviceName VARCHAR(255)
);

CREATE TABLE "Core"."DimInvoiceStatus" (
    invoiceStatus_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    invoiceStatus VARCHAR(100)
);

CREATE TABLE "Core"."DimDate" (
    date_id INT PRIMARY KEY,
    fullDate DATE,
    year INT,
    month INT,
    day INT,
    dayOfWeek VARCHAR(20)
);

CREATE TABLE "Core"."FactInvoices" (
    invoice_id INT PRIMARY KEY,
    client_id INT,
    country_id INT,
    service_id INT,
    invoiceStatus_id INT,
    issuedDate_id INT,
    dueDate_id INT,
    total DECIMAL(10,2),
    discount DECIMAL(10,2),
    tax DECIMAL(10,2),
    balance DECIMAL(10,2),
	lastUpdateDate_id INT,
    FOREIGN KEY (client_id) REFERENCES "Core"."DimClient"(client_id),
    FOREIGN KEY (country_id) REFERENCES "Core"."DimCountry"(country_id),
    FOREIGN KEY (service_id) REFERENCES "Core"."DimService"(service_id),
    FOREIGN KEY (invoiceStatus_id) REFERENCES "Core"."DimInvoiceStatus"(invoiceStatus_id),
    FOREIGN KEY (issuedDate_id) REFERENCES "Core"."DimDate"(date_id),
    FOREIGN KEY (dueDate_id) REFERENCES "Core"."DimDate"(date_id),
    FOREIGN KEY (lastUpdateDate_id) REFERENCES "Core"."DimDate"(date_id)
);

