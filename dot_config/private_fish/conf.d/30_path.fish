if command -q brew
    fish_add_path (brew --prefix)/opt/openjdk/bin;
    fish_add_path (brew --prefix)/opt/libpq/bin
end
fish_add_path ~/.cargo/bin
fish_add_path ~/.orbstack/bin
fish_add_path ~/go/bin
fish_add_path ~/bin
