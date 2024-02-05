### set specific files to executable
### goes along with fixperms
### arg1: the path to set permissions for (recursive)
function chexe() {
  local dir=${1:?"A directory or file must be specified."}
  find . -maxdepth 1 -type f -print0 | xargs -0 chmod 644 >& /dev/null; 
  find . -maxdepth 1 -type f \( -name "*.csh" -o -name "*.sh" -o -name "zoix.sim" -name "simv" \) -print0 | xargs -0 chmod 755 >& /dev/null
}