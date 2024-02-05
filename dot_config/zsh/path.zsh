shellos="UNKNOWN OS"
case $(uname) in
  Darwin)
    if [ -f /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    shellos="MAC"
    ;;
  Linux)
    ;;
esac
