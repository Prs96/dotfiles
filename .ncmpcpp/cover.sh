#!/bin/bash

LAST_HASH=""

while true; do
    COVER_PATH="/home/pranav/.ncmpcpp/tmp/album_cover.png"

    if [ ! -f "$COVER_PATH" ]; then
        COVER_PATH="$HOME/.ncmpcpp/default_cover.png"
    fi

    # Compute hash of the current image file
    CURRENT_HASH=$(md5sum "$COVER_PATH" | cut -d ' ' -f1)

    # If the image has changed, redraw it
    if [ "$CURRENT_HASH" != "$LAST_HASH" ]; then
        kitty +kitten icat --clear --silent
        kitty +kitten icat --silent --place "49x24@0x0" "$COVER_PATH"
        LAST_HASH="$CURRENT_HASH"
    fi

    sleep 1
done

