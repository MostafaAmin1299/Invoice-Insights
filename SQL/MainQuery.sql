SELECT 
	FINV.invoice_id,
	FINV.total,
	FINV.discount,
	FINV.tax,
	FINV.balance,
	DCLI.clientname,
	DCOU.countryname,
	DINVSTA.InvoiceStatus,
	DSER.servicename,
	DDAT.year AS issueddate_year,
	DDAT.month AS issueddate_month,
	DDAT.day AS issueddate_day,
	DDAT.dayofweek AS issueddate_dayofweek,
	DDAT2.year AS duedate_year,
	DDAT2.month AS duedate_month,
	DDAT2.day AS duedate_day,
	DDAT2.dayofweek AS duedate_dayofweek,
	DDAT3.year AS lastupdatedate_year,
	DDAT3.month AS lastupdatedate_month,
	DDAT3.day AS lastupdatedate_day,
	DDAT3.dayofweek AS lastupdatedate_dayofweek

FROM 
	"Core"."FactInvoices" AS FINV
Left JOIN
	"Core"."DimClient" AS DCLI
ON
	FINV.client_id = DCLI.client_id
	
Left JOIN
	"Core"."DimCountry" AS DCOU
ON
	FINV.country_id = DCOU.country_id
	
Left JOIN
	"Core"."DimDate" AS DDAT
ON
	FINV.issueddate_id = DDAT.date_id

Left JOIN
	"Core"."DimDate" AS DDAT2
ON
	FINV.duedate_id = DDAT2.date_id

Left JOIN
	"Core"."DimDate" AS DDAT3
ON
	FINV.lastupdatedate_id = DDAT3.date_id

Left JOIN
	"Core"."DimInvoiceStatus" AS DINVSTA
ON
	FINV.InvoiceStatus_id = DINVSTA.InvoiceStatus_id
	
Left JOIN
	"Core"."DimService" AS DSER
ON
	FINV.service_id = DSER.service_id

ORDER BY invoice_id ASC 