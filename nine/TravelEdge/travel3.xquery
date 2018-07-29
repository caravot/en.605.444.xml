xquery version "1.0";

<results> {
    for $motel in doc("motels.xml")//motel

    let $customer := doc("customers.xml")//customers/motel[@motelID = $motel/@motelID]
    let $amenities := doc("amenities.xml")//amenities/motel[@motelID = $motel/@motelID]
    let $price := doc("prices.xml")//prices/motel[@motelID = $motel/@motelID]

    let $avgRating := avg($customer/@customerRating)

    where $amenities/pool = 'yes'
            and $amenities/free_breakfast = 'yes'
            and $amenities/pets_allowed = 'yes'
            and $avgRating >= 3
            and $price/low <= 90

    order by $price/low

    return <motel id="{$motel/@motelID}" title="{$motel/title}" price="${$price/low}" customerRating="{round-half-to-even($avgRating, 2)}">
        <contact>
            <address>{data($motel/address)}</address>
            <city>{data($motel/city)}</city>
            <state>{data($motel/state)}</state>
            <zip>{data($motel/zip)}</zip>
            <phone>{data($motel/phone)}</phone>
            <manager>{data($motel/manager)}</manager>
        </contact>
        <amenities>
            {$amenities/wifi}
            {$amenities/laundry}
            {$amenities/pool}
            {$amenities/free_breakfast}
            {$amenities/gym}
            {$amenities/room_service}
            {$amenities/pets_allowed}
            {$amenities/business_center}
        </amenities>
    </motel>
}
</results>