xquery version "1.0";

(: 5. Extract a smaller XML that has the data for the "Industrials" category only:)
for $stock in doc("stock.xml")//stock
where $stock/category = 'Industrials'
return $stock