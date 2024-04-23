### > esscape to go to vi mode
fish_vi_key_bindings


### fish only supports specific terminals out of the box
### https://github.com/fish-shell/fish-shell/blob/76bbcb9804e7e231b6f382bcebd9f8ca4d833b72/share/functions/fish_vi_cursor.fish
set fish_vi_force_cursor 1

### only accepts block, line, and underline
### I like this idea, but the cursor change (which is essential to me, is also ugly aesthetic)
### Also usage overhead is too much

# Emulates vim's cursor shape behavior
### normal mode
set fish_cursor_default block
### edit mode
set fish_cursor_insert line
### Replace mode
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
