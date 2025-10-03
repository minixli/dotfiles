# Search command in the current working directory at last.
PATH=$PATH:.

PROJ_CFG_PATH=$HOME/Projects/config
CODE_CFG_PATH=$HOME/code/config

# All the programs used to configure environment for my projects and
# code are in these directories.
# PATH=$PATH:$PROJ_CFG_PATH
# PATH=$PATH:$CODE_CFG_PATH

# Enable me to change into my code base instantly.
export CDPATH=.:$HOME/Projects:$HOME/code

# Causes any background job that attempts to write to the terminal
# to be stopped.
stty tostop

# Tell Zsh where to find functions.
fpath=(
  $PROJ_CFG_PATH
  $CODE_CFG_PATH
  $fpath
)

# Load project config scripts as functions.
for file in $PROJ_CFG_PATH/*[!~]
do
  autoload $(basename "$file")
done

# Load code config scripts as functions.
for file in $CODE_CFG_PATH/*[!~]
do
  autoload $(basename "$file")
done

# Some helper functions used as shortcut command to configure my
# coding environment.
# shellprog () {
#   . $CODE_CFG_PATH/shell
# }

# groffprog () {
#   . $CODE_CFG_PATH/groff
# }

# Helper function used as shortcut command to configure my learning
# environment.
# learning () {
#   . $CODE_CFG_PATH/learning
# }
