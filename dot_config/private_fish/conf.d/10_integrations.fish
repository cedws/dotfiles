if command -q /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

if command -q direnv
    direnv hook fish | source
end

if command -q mise
    mise activate fish | source
end

if command -q brew
    if test -f (brew --prefix)/share/google-cloud-sdk/path.fish.inc
        source (brew --prefix)/share/google-cloud-sdk/path.fish.inc
    end
end
