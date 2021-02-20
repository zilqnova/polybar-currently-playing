# polybar-mpris

This polybar module shows details regarding the currently playing MPRIS item. This script attempts to detect the player or if from the browser, the website, and display an appropriate icon (demo needs updating).

![](screenshots/demo_mini.gif)
<!-- [](screenshots/demo.gif) -->

## Dependencies

- [playerctl](https://github.com/altdesktop/playerctl#installing) - To interface with Spotify and other MPRIS supporting players
- [zscroll](https://github.com/noctuid/zscroll#installation) - To scroll the fetched text

## Setup

To set which polybar bar has the module pass the name to `scroll_status.sh NAME`.

- Add the following in your polybar config.
Make sure to place the desired symbols for each module. You can get them from like [Font Awesome](https://fontawesome.com/cheatsheet) or [Nerd Fonts](https://www.nerdfonts.com/cheat-sheet).

```ini
[module/mpris]
type = custom/script
tail = true
; prefix symbol is shown before the text
format-prefix = "<prefix-symbol>"
format = <label>
exec = ~/.config/polybar/scripts/scroll_status.sh BAR_NAME

[module/mpris-prev]
type = custom/script
exec = echo "<previous-song-symbol>"
format = <label>
click-left = playerctl previous playerctld

[module/mpris-play-pause]
type = custom/ipc
hook-0 = echo "<playing-symbol>"
hook-1 = echo "<pause-symbol>"
initial = 1
click-left = playerctl play-pause playerctld

[module/mpris-next]
type = custom/script
exec = echo "next-song-symbol"
format = <label>
click-left = playerctl next playerctld
```

NOTE: The above given play-pause module requires IPC support enabled for its parent bar. That can be done by adding `enable-ipc = true` in your bar config.
