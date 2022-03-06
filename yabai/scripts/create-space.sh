osascript <<EOF
on run argv
    do shell script "open -b 'com.apple.exposelauncher'"
    delay 0.5
    tell application id "com.apple.systemevents"
        tell (every application process ¬
            whose bundle identifier = "com.apple.dock") to ¬
            click (button 1 of group 2 of group 1 of group 1)
        delay 0.5
        key code 53 -- esc key
    end tell
end run
EOF