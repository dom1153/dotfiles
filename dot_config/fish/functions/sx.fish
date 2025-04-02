function sx --wraps='source ~/.config/fish/config.fish' --description 'source fish config'
  source ~/.config/fish/config.fish $argv
  source ~/.config/fish/myrc/main.fish $argv
end
