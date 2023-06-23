# XFCE and i3

How to configure XFCE with i3 as the window manager.  This is pretty
much based on the [Endeavour OS XFCE + i3
tutorial](https://forum.endeavouros.com/t/tutorial-easy-setup-endeavour-xfce-i3-tiling-window-manager/13171).

1. Install XFCE and i3.
2. Login with i3 to generate the initial config and logout.
3. Edit the i3 configuration as needed.
4. Login with XFCE.
5. Disable xfwm4 and xfdesktop.
6. Add i3 to autostart.
7. Delete all XFCE keybindings.

## Steps

### Install XFCE

XFCE should already be installed as part of the Slackware base installation,
otherwise install it with `slackpkg`.

### Install i3

```shell
$ sqg -p i3
$ sbopkg -i i3
```

### Generate initial i3 config

Login with i3 to generate the initial config. Edit the config and disable the
i3_status bar by commenting out the i3_status section. Logout with
`Ctrl-Alt-Backspace`.

### Edit the i3 config

Disable the i3_status bar by editing the i3 configuration file
(`.config/i3/config`) and commenting out the i3 status bar section.

### Configure XFCE session

Login with XFCE. Open the XFCE settings manager and go to `Session and Startup >
Current Session`. Find `xfwm4` and `xfdesktop` and switch them from
`Immediately` to `Never`, and then click `Save Session`.

### Configure XFCE startup

Still in the XFCE settings manager `Session and Startup`, go to `Application
Autostart` and add i3, which should be triggered on login (by default).

### Delete all XFCE keybindings

Delete all keybindings in the XFCE settings manager `Keyboard > Application
Shortcuts`.

Delete all keybindings in the XFCE settings manager `Window Manager`.

Logout again with `Ctrl-Alt-Backspace` and login with XFCE. It should be done.
