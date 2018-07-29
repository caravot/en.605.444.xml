xquery version "1.0";

(: 10. Make a "BUY" recommendation on all the stocks where the current price is less than the opening price:)
<buy>{
    for $stock in doc("stock.xml")//stock
    where $stock/today/@current < $stock/today/@open
    order by $stock/sName
    return <stock>{data($stock/sName)}</stock>
}</buy>