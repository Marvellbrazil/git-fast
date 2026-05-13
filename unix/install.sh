#!/bin/bash

SOURCE_FILE="bash.txt"
MARKER="git-fast"
SUCCESS=false

if [[ "$OSTYPE" == "darwin"* ]]; then
    TARGET="$HOME/.zshrc"
else
    TARGET="$HOME/.bashrc"
fi

if [[ -f "$SOURCE_FILE" ]]; then
    CONTENT=$(cat "$SOURCE_FILE")
    BLOCK="\n$MARKER\n$CONTENT\n$MARKER"

    if grep -q "$MARKER" "$TARGET"; then
        sed -i "/$MARKER/,/$MARKER/d" "$TARGET"
        echo -e "$BLOCK" >> "$TARGET"
    else
        echo -e "$BLOCK" >> "$TARGET"
    fi
    
    SUCCESS=true
    echo -e "\033[0;32mgit-fast successfully applied on $TARGET.\033[0m"
else
    echo -e "\033[0;31m'$SOURCE_FILE' cannot be found.\033[0m"
fi

echo -e "\033[0;90mThis window will be closed automatically in 5 seconds...\033[0m"
sleep 5
kill -9 $PPID