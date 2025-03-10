#!/usr/bin/env bash
source "$CONFIG_DIR/colours.sh" # Loads all defined colors

PLUGIN_DIR="$CONFIG_DIR/plugins"

##### Adding aeropsace layouts #####
sketchybar --add event aerospace_workspace_change

# Assign correct Aerospace workspaces
temp_file=$(mktemp)
"$CONFIG_DIR/match_displays.sh" >"$temp_file"
while IFS='|' read -r DISPLAY_ID NSSCREEN_ID AERO_ID AERO_NAME; do
    for sid in $(aerospace list-workspaces --monitor "$AERO_ID" </dev/null); do
        space_props=(
            display=$DISPLAY_ID
            icon="$sid"

            background.color=$BACKGROUND_1
            background.drawing=off

            label.font="sketchybar-app-font:Regular:16.0"
            label.y_offset=-1
            label.padding_right=5
            label.padding_left=0

            icon.padding_right=0
            icon.padding_left=5

            script="$PLUGIN_DIR/space.sh"
        )

        sketchybar \
            --add space space."$sid" left \
            --set space."$sid" "${space_props[@]}" \
            --set space."$sid" associated_space="$sid" \
            --subscribe space."$sid" aerospace_workspace_change
    done
done <"$temp_file"

# Create the invisible event item
sketchybar --add item system.aerospace.event left \
    --set system.aerospace.event label="" drawing=off \
    --subscribe system.aerospace.event space_windows_change aerospace_workspace_change \
    --set system.aerospace.event script="$CONFIG_DIR/items/hide_spaces.sh"
