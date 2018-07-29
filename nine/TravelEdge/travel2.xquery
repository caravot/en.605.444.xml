xquery version "1.0";

<results> {
    for $motel in doc("motels.xml")//motel
    let $amenities := doc("amenities.xml")//amenities/motel[@motelID = $motel/@motelID]
    let $price := doc("prices.xml")//prices/motel[@motelID = $motel/@motelID]

    where $amenities/wifi = 'yes'
            and $amenities/business_center = 'yes'
            and $amenities/gym = 'yes'
            and $amenities/rating >= 3
            and $price/median < 120

    order by $price/median

    return <motel id="{$motel/@motelID}" title="{$motel/title}" price="${$price/median}" rating="{$amenities/rating}">
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