xquery version "1.0";

(: 2. List all stock items that opened at $30 or higher:)
for $stock in doc("stock.xml")//stock
where $stock/today[@open > '30']
order by $stock/sName
return <stock name="{data($stock/sName)}" open="{data($stock/today/@open)}"></stock>