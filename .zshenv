#
# This file would be always sourced. In particular, when executing
# a command remotely with ssh or Capistrano, this is the only file
# to be sourced besides .zprofile and .zshrc.
#
# See https://github.com/rbenv/rbenv/wiki/unix-shell-initialization

# The command to generate tags files for JS projects is too long.
alias jsctags="find . -type f -iregex \".*\.js$\" -not -path \"./node_modules/*\" -exec jsctags {} -f \; | sed \"/^$/d\" | LANG=C sort > tags"
 
# if you would like tags generated for files within node_modules/
alias jsctagsall="find . -type f -iregex \".*\.js$\" -exec jsctags {} -f \; | sed \"/^$/d\" | LANG=C sort > tags"
