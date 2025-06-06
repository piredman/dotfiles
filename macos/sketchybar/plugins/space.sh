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
        sketchybar --set $NAME background.drawing=on \
            background.color=$TRANSPARENT \
            label.color=$ACCENT_COLOUR \
            icon.color=$ACCENT_COLOUR
    fi

}

activate-workspace() {
    CURRENT_WORKSPACE="space.$(aerospace list-workspaces --monitor focused --visible)"
    if [ "$NAME" != $CURRENT_WORKSPACE ]; then
        WORKSPACE_LABEL="$(echo $NAME | sed 's/^.\{6\}//')"
        aerospace workspace $WORKSPACE_LABEL
    fi
}

case "$SENDER" in
    "mouse.clicked")
        activate-workspace
        ;;
    *)
        update
        ;;
esac
