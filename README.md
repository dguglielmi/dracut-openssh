dracut-openssh
--------------

# Description

dracut-openssh is another Dracut module to start sshd in the initramfs.

The main purpose of this module is to allow entering LUKS volumes passphrase at system boot time remotely.

This project is strongly inspired by [dracut-sshd][dsshd], and some files comes from it, but adapted to work better with my systems.

# Dependencies

    - dracut >= 0.49
    - systemd
    - Dracut "network" or "systemd-networkd" module

# Installation
    - make install
    - dracut -f

# Configuration

Use `/etc/dracut.conf.d/dracut-openssh.conf` to override defaults module settings

By default dracut-openssh will copy the current system sshd host keys into the initramfs. For security reasons I encourage you to generates some new keys, dedicated to the initramfs and configure `*_host_key` sections in the config file.

Don't forget to re-run `dracut -f` after any changes.

## Network Providers

If you use systemd-networkd to configure your network, dracut-openssh will use (by default) thoses files to configure network in the initramfs but you can provide your own dedicated files or use the dracut "network" module to configure the network part (see the [Dracut documentation][dnetwork]) 

[dsshd]: https://github.com/gsauthof/dracut-sshd
[dnetwork]: http://man7.org/linux/man-pages/man7/dracut.cmdline.7.html
