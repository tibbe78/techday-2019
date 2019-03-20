
#!/usr/bin/python
import sys
from pynput import keyboard
i = 1
text = 'Denna text ska jag skriva utan att stava jattefort tackar'

def on_release(key):
    global i
    if key == '!':
        sys.exit()
    if i > len(text):
        sys.exit()
    print(text[i], end='')
    i =  i + 1

# Collect events until released
with keyboard.Listener(on_release=on_release) as listener:
    listener.join()
