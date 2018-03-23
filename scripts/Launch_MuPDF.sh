#!/bin/bash
#!/usr/bin/env sh

# Terminate already running instances
killall -q mupdf

# Wait until the processes have been shut down
while pgrep -x mupdf >/dev/null; do sleep 1; done

# Launch MuPDF with the first argument passed by vim
mupdf $1
