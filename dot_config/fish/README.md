My fish config conventions
completions/ -> should be basically empty, brew will provide vendor completions
conf.d/ -> env and path configurations which run before main config
features/ -> main configuration files, mostly shell integration calls, abbreviations, post setup enviornment variables, and custom keybinds
functions/ -> custom user functions

fisher was used to download the catppuccin themes.
any dependencies are installed directly to dotfiles
