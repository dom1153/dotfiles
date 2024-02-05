### recursivly set files and folders to be non-executable
### related to chexe
### arg1: the path to set permissions for (recursive)
function fixperms() {
  local dir=${1:?"A directory or file must be specified."}

  find ${dir} -type d -exec chmod 755 {} +
  find ${dir} -type f -exec chmod 644 {} +
}

### consider