### post conf.d environment settings
if exists hx
    set -gx EDITOR hx
else
    set -gx EDITOR vi
end

if exists brew
    set -gx HOMEBREW_NO_ENV_HINTS 1
end
