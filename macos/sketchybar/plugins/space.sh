#!/usr/bin/env bash

update() {
    source "$CONFIG_DIR/colours.sh" # Loads all defined colors

    CURRENT_WORKSPACE="space.$(aerospace list-workspaces --monitor focused --visible)"
    if [ "$NAME" = $CURRENT_WORKSPACE ]; then
        sketchybar --set $NAME background.drawing=on \
            background.color=$ACCENT_COLOUR \
            label.color=$SHADOW_COLOUR \
            icon.color=$SHADOW_COLOUR$
    else
        sketchybar --set $NAME background.drawing=off \
            label.color=$ACCENT_COLOUR \
            icon.color=$ACCENT_COLOUR
    fi

}

# Can expand case statement to handle other events. ie: mouse.clicked
case "$SENDER" in
    *)
        update
        ;;
esac
