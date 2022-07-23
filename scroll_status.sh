#!/bin/bash

#Call the get_status script with the supplied BAR_NAME in polybar's config.ini
cmd="${0%/*}/get_status.sh $1"

zscroll -l 30 \
    --scroll-padding "$(printf ' %.0s' {1..8})" \
    -d 0.5 \
    -M "$cmd icon" \
    -m "none"       "-b ''" \
    -m "browser"    "-b ' '" \
    -m "netflix"    "-b 'ﱄ '" \
    -m "youtube"    "-b ' '" \
    -m "prime"      "-b ' '" \
    -m "spotify"    "-b ' '" \
    -m "vlc"        "-b '嗢 '" \
    -m "mpv"        "-b ' '" \
    -m "kdeconnect" "-b ' '" \
    -m "corridor"   "-b ' '" \
    -u t "$cmd" &

wait



truncate () {
	# Truncate input to trunclen
	trunclen="35"
	echo "$cmd" | sed 's/\(.\{35\}\).*/\1.../'
}
