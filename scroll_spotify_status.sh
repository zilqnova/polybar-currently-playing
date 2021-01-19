#!/bin/bash

cmd="${0%/*}/get_spotify_status.sh"
[ -z "$1" ] && echo "Usage: ${0} length" && exit 1

zscroll -l "$1" \
    --scroll-padding "$(printf ' %.0s' {1..8})" \
    --delay 0.1 \
    --match-command "$cmd icon" \
    --match-text "none"       "-b ''" \
    --match-text "browser"    "-b ' '" \
    --match-text "netflix"    "-b 'ﱄ '" \
    --match-text "youtube"    "-b ' '" \
    --match-text "prime"      "-b ' '" \
    --match-text "spotify"    "-b ' '" \
    --match-text "vlc"        "-b '嗢 '" \
    --match-text "mpv"        "-b ' '" \
    --match-text "kdeconnect" "-b ' '" \
    --update-check true "$cmd" &

wait

