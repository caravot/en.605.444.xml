xquery version "1.0";

(: 9. List all the stock items that contain the word "technology" in the description:)
for $stock in doc("stock.xml")//stock
let $name := $stock/sName
where contains($stock/description, 'technology')
return <stock>{$name}</stock>
