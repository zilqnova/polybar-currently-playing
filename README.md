# polybar-mpris

This polybar module shows details regarding the currently playing MPRIS item. This module uses [playerctl](https://github.com/altdesktop/playerctl) to do all the work and hence, no >100 line scripts which do all the work themselves. Only one line to fetch the required metadata in the format that you like and another line to scroll the fetched text using [zscroll](https://github.com/noctuid/zscroll).

![](screenshots/demo_mini.gif)
![](screenshots/demo.gif)

## Dependencies

- [playerctl](https://github.com/altdesktop/playerctl#installing) - To interface with Spotify and other MPRIS supporting players
- [zscroll](https://github.com/noctuid/zscroll#installation) - To scroll the fetched text

## Setup

To set which polybar bar has the module pass the name to `get_status.sh NAME` or edit the required variable in [get_status.sh](get_status.sh) as shown below.
```sh
# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="now-playing"
```

- Add the following in your polybar config.
Make sure to place the desired symbols for each module. You can get them from like [Font Awesome](https://fontawesome.com/cheatsheet) or [Nerd Fonts](https://www.nerdfonts.com/cheat-sheet).

```ini
[module/mpris]
type = custom/script
tail = true
; prefix symbol is shown before the text
format-prefix = "<prefix-symbol>"
format = <label>
exec = ~/.config/polybar/scripts/scroll_status.sh 30

[module/mpris-preev]
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
