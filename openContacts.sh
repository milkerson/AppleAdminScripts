#!/bin/sh

echo | osascript <<EOF
tell application "Contacts.app"
  activate
end tell
EOF