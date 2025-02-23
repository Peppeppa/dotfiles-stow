#---- functions  -----

#   Alias cd -> clear screen -> modern ls
cdd() {
    cd "$1" && clear && eza -ahl --color=auto
}

#   Alias update -> updates package manager
update() {
  . /etc/os-release

  case "$ID" in
    ubuntu|debian)
      sudo apt update && apt dist-upgrade -y
      ;;
    fedora)
      sudo dnf update -y
      ;;
    centos|rhel)
      sudo yum update -y
      ;;
    arch|manjaro)
      sudo pacman -Syu -y --noconfirm
      ;;
    opensuse-tumbleweed)
      sudo zypper up -y
      ;;
    *)
      ;;
  esac
}
