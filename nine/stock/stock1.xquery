xquery version "1.0";

(: 1. List all stock items:)
for $stock in doc("stock.xml")//stock
return $stock/sName
