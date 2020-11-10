# maimfuse

A helper script to let me screenshot the way I want. My Screenshot workflow is very unique and different from most people's ways, simply because I've been very used to how I configured ShareX on windows. This script is meant to help me with having my screenshots set up almost the exact same way.

## Dependencies

``maim xdotool xclip paplay``

## Installing maimfuse

NOTE: Very soon, I will adjust this repository in such a way that it will work with a setup script and GNU stow. This is temporary or if you want to install this manually for some odd reason.

```
chmod +x maimfuse
sudo ln -s /home/<username>/path/to/maimfuse /usr/local/bin/maimfuse
```
Alternatively, you can move it to /usr/local/bin/. Be sure to also move the sound file though if you do so.

From here, assign shortcuts using the flags below.

## Flags
```-a: Select area or window to screenshot
-c: Save image in clipboard
-w: Screenshot the active window
```

## Known bugs
Try not to save something via clipboard that isn't an image. I'm not quite sure how to get xclip to detect and handle other kinds of clipboard content, but that's fine. Just don't try to save something that isn't an image and you should be fine.

Area select will use the currently active window's process name to put into the filename. If this bothers you, go into line 19 of the main script and change the ``arealoc`` variable - you can remove the ``"$processname"`` that's inside of it and change it to something else, so that it'd say ``arealoc=$loc"/area_"$nowday.png``. This would replace the process name with "area". Since I often use the area select to just screenshot my current window anyways, it doesn't bother me.
