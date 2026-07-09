#!/bin/zsh
# Double-click this file to start the Mandarin Learning Tool and open it in your browser.
cd "$(dirname "$0")"
if ! curl -s -o /dev/null http://localhost:8888/; then
  nohup python3 -m http.server 8888 --bind 127.0.0.1 >/dev/null 2>&1 &
  sleep 1
fi
open "http://localhost:8888"
