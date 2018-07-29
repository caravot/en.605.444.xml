xquery version "1.0";

<results> {
for $motel in doc("motels.xml")//motel
    let $customer := doc("customers.xml")//customers/motel[@motelID = $motel/@motelID]
    let $amenities := doc("amenities.xml")//amenities/motel[@motelID = $motel/@motelID]

    let $avgRating := avg($customer/@customerRating)
    order by $amenities/rating descending, $avgRating descending

    return <motel id="{$motel/@motelID}" title="{$motel/title}">
        <contact>
            <address>{data($motel/address)}</address>
            <city>{data($motel/city)}</city>
            <state>{data($motel/state)}</state>
            <zip>{data($motel/zip)}</zip>
            <phone>{data($motel/phone)}</phone>
            <manager>{data($motel/manager)}</manager>
        </contact>
        <class>
            {$amenities/rating}
            <avgCustomerRating>{round-half-to-even($avgRating, 2)}</avgCustomerRating>
        </class>
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