xquery version "1.0";


(: 8. Aggregate the earnings for all the stock items based on the (distinct) category:)
for $category in distinct-values(doc("stock.xml")/portfolio/stock/category)
let $earnings := doc("stock.xml")//stock[category = $category]/earnings
return <department name="{$category}" totQuantity="{round-half-to-even(sum($earnings), 2)}"/>
