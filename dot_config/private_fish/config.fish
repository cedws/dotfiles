if status is-interactive
    # Commands to run in interactive sessions can go here

    set fish_greeting

    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
    set -gx HOMEBREW_SHELLENV_PREFIX "/opt/homebrew";

    fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
    fish_add_path /opt/homebrew/share/man
    fish_add_path /opt/homebrew/share/info
    fish_add_path /opt/homebrew/opt/openjdk@11/bin;
    fish_add_path ~/go/bin

    set -x VISUAL nano
    set -x EDITOR $VISUAL

    alias ls="exa"
    alias rg="rg --no-ignore -F"
    alias fd="fd --no-ignore"
end
