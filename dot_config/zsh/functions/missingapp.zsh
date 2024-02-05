function missingapp() {
  local arg=${1:?"app name required"}
  echo "Please install '$1' to use this command"
}
