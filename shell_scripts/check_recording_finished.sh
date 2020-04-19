now=$(date "+%s")
finished="false"

until [  $finished = "true" ]; do
    sleep 1

    frontdoor=$(date -r /config/www/front_door.mp4 "+%s")

    if [ $frontdoor -gt $now ]; then
    finished="true"
    hass-cli service call input_boolean.turn_off --arguments entity_id=input_boolean.camgrab_front_door
    else
    finished="false"
    fi
done