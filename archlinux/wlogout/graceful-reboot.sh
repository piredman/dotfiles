# close all client windows
HYPRCMDS=$(hyprctl -j clients | jq -j '.[] | "dispatch closewindow address:\(.address); "')
hyprctl --batch "$HYPRCMDS" >>/tmp/hypr/hyprexitwithgrace.log 2>&1

# shutdown
reboot now >>/tmp/hypr/hyprexitwithgrace.log 2>&1
