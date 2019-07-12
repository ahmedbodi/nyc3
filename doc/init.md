Sample init scripts and service configuration for nyc3d
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/nyc3d.service:    systemd service unit configuration
    contrib/init/nyc3d.openrc:     OpenRC compatible SysV style init script
    contrib/init/nyc3d.openrcconf: OpenRC conf.d file
    contrib/init/nyc3d.conf:       Upstart service configuration file
    contrib/init/nyc3d.init:       CentOS compatible SysV style init script

Service User
---------------------------------

All three Linux startup configurations assume the existence of a "nyc3" user
and group.  They must be created before attempting to use these scripts.
The OS X configuration assumes nyc3d will be set up for the current user.

Configuration
---------------------------------

At a bare minimum, nyc3d requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, nyc3d will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that nyc3d and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If nyc3d is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running nyc3d without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `contrib/debian/examples/nyc3.conf`.

Paths
---------------------------------

### Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/nyc3d`  
Configuration file:  `/etc/nyc3/nyc3.conf`  
Data directory:      `/var/lib/nyc3d`  
PID file:            `/var/run/nyc3d/nyc3d.pid` (OpenRC and Upstart) or `/var/lib/nyc3d/nyc3d.pid` (systemd)  
Lock file:           `/var/lock/subsys/nyc3d` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the nyc3 user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
nyc3 user and group.  Access to nyc3-cli and other nyc3d rpc clients
can then be controlled by group membership.

### Mac OS X

Binary:              `/usr/local/bin/nyc3d`  
Configuration file:  `~/Library/Application Support/Nyc3/nyc3.conf`  
Data directory:      `~/Library/Application Support/Nyc3`  
Lock file:           `~/Library/Application Support/Nyc3/.lock`  

Installing Service Configuration
-----------------------------------

### systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start nyc3d` and to enable for system startup run
`systemctl enable nyc3d`

### OpenRC

Rename nyc3d.openrc to nyc3d and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/nyc3d start` and configure it to run on startup with
`rc-update add nyc3d`

### Upstart (for Debian/Ubuntu based distributions)

Drop nyc3d.conf in /etc/init.  Test by running `service nyc3d start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

### CentOS

Copy nyc3d.init to /etc/init.d/nyc3d. Test by running `service nyc3d start`.

Using this script, you can adjust the path and flags to the nyc3d program by
setting the PIGEOND and FLAGS environment variables in the file
/etc/sysconfig/nyc3d. You can also use the DAEMONOPTS environment variable here.

### Mac OS X

Copy org.nyc3.nyc3d.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.nyc3.nyc3d.plist`.

This Launch Agent will cause nyc3d to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run nyc3d as the current user.
You will need to modify org.nyc3.nyc3d.plist if you intend to use it as a
Launch Daemon with a dedicated nyc3 user.

Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
