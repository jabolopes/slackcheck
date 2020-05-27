#!/bin/bash
#
# Makes the current user a sudoer.

set -e

if ! grep wheel /etc/group | grep "${TARGET}" &> /dev/null; then
    readonly TARGET="${USER}"
    echo Adding "${TARGET}" to group wheel
    su -c "usermod -aG wheel "${TARGET}""
    echo Please logout and login for changes to apply
fi

echo Uncommenting group wheel in /etc/sudoers
su -c 'sed -i -e "/# %wheel ALL=(ALL) ALL/ s,# ,," /etc/sudoers'
