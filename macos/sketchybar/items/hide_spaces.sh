#!/usr/bin/env bash

# Hide the workspaces that do not have active applications
for monitor_id in $(aerospace list-monitors --format "%{monitor-appkit-nsscreen-screens-id}"); do
    for sid in $(aerospace list-workspaces --monitor $monitor_id --empty no); do
        sketchybar --set space."$sid" drawing=true
    done

    for sid in $(aerospace list-workspaces --monitor $monitor_id --empty --visible no); do
        sketchybar --set space."$sid" drawing=false
    done
done

for sid in $(aerospace list-workspaces --focused); do
    sketchybar --set space."$sid" drawing=true
done
