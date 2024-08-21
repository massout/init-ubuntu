sudo apt update
sudo apt -y upgrade

sudo apt -y install build-essential make cmake git wget gpg curl g++

# Solution of Dual-Boot Time Ambiguity
timedatectl set-local-rtc 1

# Gnome Tweaks
sudo apt -y install gnome-tweaks

# Nvidia Drivers
sudo apt -y install ubuntu-drivers-common
sudo ubuntu-drivers autoinstall

# Python3
sudo apt -y install python-is-python3
sudo apt -y install python3-pip

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install -f -y google-chrome-stable

# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -y -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code 

xdg-mime default code.desktop text/plain

# ROS2
locale  # check for UTF-8

sudo apt update 
sudo apt -y install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

sudo apt -y install software-properties-common
sudo add-apt-repository -y universe

sudo apt update
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update
sudo apt -y upgrade

sudo apt -y install ros-humble-desktop
sudo apt -y install ros-dev-tools

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# KiCAD
sudo apt -y install kicad kicad-footprints kicad-libraries kicad-packages3d kicad-symbols kicad-templates

# OBS Studio
sudo add-apt-repository -y ppa:obsproject/obs-studio
sudo apt update
sudo apt -y install obs-studio

# Blender 
sudo apt -y install blender

# VLC
sudo apt -y install vlc

# Krita
sudo apt -y install krita

# ShotCut
sudo apt -y install shotcut

# Rhythmbox
sudo apt -y install rhythmbox

# Synaptic
sudo apt -y install synaptic

# TLP
sudo apt -y install tlp
sudo tlp start

# Set ROS2 Workspace 
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws
colcon build
echo "source ~/ros2_ws/install/local_setup.bash" >> ~/.bashrc

#
# Personalization
#
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/jj_dark_by_Hiking93.jpg'
gsettings set org.gnome.gedit.preferences.editor highlight-current-line false
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.desktop.peripherals.mouse accel-profile 'flat'
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste true
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.shell.extensions.ding start-corner 'top-left'
gsettings set org.gnome.shell.extensions.ding show-home true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.settings-daemon.plugins.power power-saver-profile-on-low-battery true
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power power-button-action 'interactive'
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.settings-daemon.plugins.power lid-close-ac-action 'suspend'
gsettings set org.gnome.settings-daemon.plugins.power lid-close-battery-action 'suspend'
dconf write /org/gnome/shell/favorite-apps "['org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'org.gnome.Terminal.desktop', 'gnome-terminal.desktop', 'code.desktop']"



