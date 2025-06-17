#
#   ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#   ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#   ██████╔╝███████║███████╗███████║██████╔╝██║     
#   ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
#██╗██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
#╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#                                                   
#--------------------------------------------------
#-----   Load config   -----

export CONFIG_DIR="$HOME/.config/shell"

load_shell_config () {
  local SHELL_NAME="$(basename "$SHELL")"
  local SHELL_DIR="$CONFIG_DIR/$SHELL_NAME"

  for file in "$CONFIG_DIR/common/"*.sh "$SHELL_DIR/"*.sh; do
    source "$file"
   # echo "✅ Lade: $file"
  done
}

load_shell_config
source "/home/medvidec/git/eternal-pingdom/toolbox/completion/ep"
