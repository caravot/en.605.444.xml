xquery version "1.0";

(: 4. List all the stock items that have a PE ratio of 20 or greater:)
for $stock in doc("stock.xml")//stock
where $stock/pe_ratio != 'na' and $stock/pe_ratio > 20
order by $stock/sName
return <stock name="{data($stock/sName)}" pe_ratio="{data($stock/pe_ratio)}"></stock>