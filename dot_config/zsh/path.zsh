shellos="UNKNOWN OS"
case $(uname) in
  Darwin)
    ### it's hard for devs to set env through system apps
    if [ -d "/Applications/kitty.app/Contents/MacOS" ]; then
      export PATH="/Applications/kitty.app/Contents/MacOS:$PATH"
    fi
    if [ -f /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    shellos="MAC"
    ;;
  Linux)
    ;;
esac
