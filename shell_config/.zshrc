#
#███████╗███████╗██╗  ██╗██████╗  ██████╗
#╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#  ███╔╝ ███████╗███████║██████╔╝██║     
# ███╔╝  ╚════██║██╔══██║██╔══██╗██║     
#███████╗███████║██║  ██║██║  ██║╚██████╗
#╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#-------------------------------------------
#-----   Load config   -----

export CONFIG_DIR="$HOME/.config/shell"

load_shell_config () {
  local SHELL_DIR="$CONFIG_DIR/$(basename "$SHELL")"
  for file in "$CONFIG_DIR/common/"*.sh "$SHELL_DIR/"*.sh"; do
    [ -f "$file" ] && source "$file"
  done
}

