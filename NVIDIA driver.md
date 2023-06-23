# NVIDIA driver

How to install the NVIDIA driver on an ASUS laptop with both Intel and
NVIDIA cards. This enables the NVIDIA card only and disables the Intel
card. This is mostly based on the [Arch Linux
guide](https://wiki.archlinux.org/title/NVIDIA_Optimus#Use_NVIDIA_graphics_only).

1. Install the NVIDIA driver (and kernel module) from Slackbuilds.org
2. Install the xf86-video-nouveau-blacklist. Can be done via `slackpkg`.
3. Configure the NVIDIA card in the Xorg configuration.
4. Configure the KDE login manager (aka SDDM).

## Steps

Install the NVIDIA driver:

```shell
$ export MAKEFLAGS=-j8
$ sqg -p nvidia-driver
$ sbopkg -i nvidia-driver
```

Disable the nouveau driver:

```shell
$ slackpkg install xf86-video-nouveau-blacklist
```

Configure the NVIDIA card in the Xorg configuration. Create the file
`/etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf` with the
following contents:

```
Section "OutputClass"
    Identifier "intel"
    MatchDriver "i915"
    Driver "modesetting"
EndSection

Section "OutputClass"
    Identifier "nvidia"
    MatchDriver "nvidia-drm"
    Driver "nvidia"
    Option "AllowEmptyInitialConfiguration"
    Option "PrimaryGPU" "yes"
    ModulePath "/usr/lib/nvidia/xorg"
    ModulePath "/usr/lib/xorg/modules"
EndSection
```

Configure KDE login manager by editing the file
`/usr/share/sddm/scripts/Xsetup` and adding the following commands to
the top of the file.

```shell
$ xrandr --setprovideroutputsource modesetting NVIDIA-0
$ xrandr --auto
```
