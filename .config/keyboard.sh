setxkbmap -option caps:backspace
setxkbmap -option shift:both_capslock
setxkbmap -layout us

xset r rate 150 40

# Device-specific: Swap Alt and Super ONLY for MX Keys (Magic Keyboard)
# Check if MX Keys is connected
if xinput list | grep -q "MX Keys M Mac Keyboard.*slave  keyboard"; then
    # Apply the Alt/Super swap globally (only affects when MX Keys is active)
    xmodmap -e "clear mod1"
    xmodmap -e "clear mod4"
    xmodmap -e "keycode 133 = Alt_L NoSymbol Alt_L"
    xmodmap -e "keycode 64 = Super_L NoSymbol Super_L"
    xmodmap -e "add mod1 = Alt_L"
    xmodmap -e "add mod4 = Super_L"
fi
