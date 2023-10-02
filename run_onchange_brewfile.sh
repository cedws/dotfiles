#!/bin/sh

{{ if eq .chezmoi.os "darwin" }}
# {{ include "Brewfile" | sha256sum }}
brew bundle
{{ end }}
