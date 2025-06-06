#!/bin/bash

echo "Welcome to the Hyprland with Hyprpanel install script!"
echo "Pay attention while this runs. It will ask for your password for sudo access."
echo "This will use the default hyprland dotfiles. So you will be on your own for themeing."
echo "Enter y if you want to proceed or n if you want to exit"
read response

if [[response eq 'n']]; then
    exit 0
fi

cd ~/Downloads

## Hyprland
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
## dependencies from Debian repos
sudo apt install build-essential cmake cmake-extras dolphin fontconfig gettext gettext-base git glslang-tools golang hwdata hyprpaper kitty lib-pango1.0-dev lib-xcursor-dev libavcodec-dev libavformat-dev libavutil-dev libdisplay-info-deb libdrm-dev libegl-dev libegl1-mesa-dev libffi-dev libfontconfig-dev libgbm-dev libgl1-mesa-dev libgles2 libhyprcursor-dev libhyprlang-dev libinput-bin libinput-dev libjson-glib-dev libpam0g-dev libpixman-1-dev libpugixml-dev libre2-dev librust-pangocairo-dev librust-wayland-client-dev libsdbus-c++-dev libseat-dev libtomlplusdplus-dev libtomlplusplus3 libudev-dev libxcb-composite0-dev libxcb-dri3-dev libxcb-errors-dev libxcb-ewmh-dev libxcb-ewmh2 libxcb-icccm4-dev libxcb-present-dev libxcb-render-util0-dev libxcb-res0-dev libxcb-xfixes-dev libxcb-xfixes0-dev libxcb-xinput-dev libxcbcommon-dev libxkbcommon-dev libxkbcommon-x11-dev libxkbregistry-dev libxml2-dev meson ninja-build qt6-wayland-dev qt6-wayland-private-dev seatd wayland-protocols wget wofi
## Aquamarine
git clone https://github.com/hyprwm/aquamarine.git
cd aquamarine
## hyprwayland-scanner
git clone https://github.com/hyprwm/hyprwayland-scanner.git
cd hyprwayland-scanner
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install build
## back to Aquamarine
cd ..
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
## hyprutils
git clone https://github.com/hyprwm/hyprutils.git
cd hyprutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
cd ../..
## hyprgraphics
git clone https://github.com/hyprwm/hyprgraphics
cd hyprgraphics
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
cd ..
## hyprland-qtutils
git clone https://github.com/hyprwm/hyprland-qtutils.git
cd hyprland-qtutils
## hyprland-qt-support
git clone https://github.com/hyprwm/hyprland-qt-support.git
cd hyprland-qt-support
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_QML_PREFIX=/lib/qt6/qml -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
cd ..
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install build
cd ..
## build and install Hyprland
make all && sudo make install

## hypridle
git clone https://github.com/hyprwm/hypridle.git
cd hypridle
## hyprlang
git clone https://github.com/hyprwm/hyprlang.git
cd hyprlang
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build
cd ..
## hyprland-protocols
git clone https://github.com/hyprwm/hyprland-protocols.git
cd hyprland-protocols
meson setup build
cd build
meson install
cd ../..
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..
# hyprlock
git clone https://github.com/hyprwm/hyprlock.git
cd hyprlock
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build
cd ..
## install dependencies from Debian repos
sudo apt install node-typescript npm meson libgjs-dev gjs libgtk-layer-shell-dev libgtk-3-dev libpulse-dev network-manager-dev libgnome-bluetooth-3.0-dev libdbusmenu-gtk3-dev libsoup-3.0-dev libwireplumber-0.5-dev libnm-dev libgtop2-dev cava libiniparser-dev libfftw3-dev libsass-dev liblz4-dev
## hyprpanel
git clone https://github.com/Jas-SinghFSU/HyprPanel.git
cd HyprPanel
## astal
git clone https://github.com/aylur/astal.git
cd astal/lib/astal/io
meson setup --prefix /usr build
meson install -C build
cd ..
cd gtk3
meson setup --prefix /usr build
meson install -C build
cd ..
cd gtk4
meson setup --prefix /usr build
meson install -C build
cd ../..
cd hyprland
meson setup --prefix /usr build
meson install -C build
cd ..
cd notifd
meson setup --prefix /usr build
meson install -C build
cd ..
cd tray
git clone https://github.com/rilian-la-te/vala-panel-appmenu.git
cd vala-panel-appmenu/subprojects/appmenu-glib-translator
meson setup --prefix /usr build
meson install -C build
cd ../..
cd mpris
meson setup --prefix /usr build
meson install -C build
cd ../..
cd lang/gjs
meson setup --prefix /usr build
meson install -C build
cd ../../..
## ags
git clone --recursive https://github.com/Aylur/ags.git
cd ags
go install -ldflags "\
   -X 'main.gtk4LayerShell=$(pkg-config --variable=libdir gtk4-layer-shell-0)/libgtk4-layer-shell.so' \
   -X 'main.astalGjs=$(pkg-config --variable=srcdir astal-gjs)'"
cd ..
## swww
git clone https://github.com/LGFae/swww.git
cd swww
cargo build --release
cd ..
## sass
brew install sass/sass/sass
sudo ln -s /home/linuxbrew/.linuxbrew/bin/sass /usr/bin/sass
## configure/install hyprpanel
meson setup build
meson compile -C build
meson install -C build

git clone https://github.com/steveo314/debian-hypr.git
cd debian-hypr
mkdir -p ~/.config/hypr
cp hyprland.conf ~/.config/hypr

echo "Please reboot and give Hyprland a go!"
echo "Thank you for using my install script!"
exit 0
