# Thunar and Samba

Thunar can connect to Samba shares by navigating to locations, such
as, `smb://myhostname/myuser`. There are a couple of errors that can
occur if the dekstop / window manager is not running correctly, such
as, typing locations `smb://` will cause icon on the navigation bar to
turn red and clicking on `Network` will fail with operation not
supported.

To run the desktop / window manager correctly, it must be started by a
statement like the following:

```shell
exec ck-launch-session dbus-launch --exit-with-session /usr/bin/i3
```

I typically solve this by installing i3, which comes with a good
`xinitrc`, and slim, which executes the `xinitrc`. For some reason, it
appears that gdm doesn't launch the desktop / window manager with
dbus-launch, perhaps because gdm sets the environment variable
`$DESKTOP_SESSION` and it doesn't get to execute the right
line. Either way, I simply avoid gdm.
