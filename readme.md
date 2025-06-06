<div class="row">
    <div class="column">
        <img src="https://github.com/steveo314/debian-hypr/blob/main/images/Debian_logo.png" width="64" height="64"/>
    </div>
    <div class="column">
        <img src="https://github.com/steveo314/debian-hypr/blob/main/images/UbuntuCoF.svg" width="64" height="64"/>
    </div>
</div>
Welcome to steveo314's hyprland with hyprpanel install
script for Debian Sid.

With this script I aim to have it working on Debian Trixie,
Debian Sid, and Ubuntu Plucky.

*** This script does ask for sudo permission but does not
copy anything harmful around your machine ***

This will install the latest packages from github and only
install necessary dependencies from the Debian and Ubuntu
repos.

There are still some tweaks that need to be done with this
install script. Proceed at your own risk.

You may have to install sddm for Hyprland to load in correctly.
If not you will have to launch Hyprland from a tty.

Unless you are using the Fish shell, you can run the script
this way (curl is required to run this command):

`sh <(curl -L https://raw.githubusercontent.com/steveo314/debian-hypr/refs/heads/main/hypr_build.sh)`
