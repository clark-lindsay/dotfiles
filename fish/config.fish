if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x VIMCONFIG "~/.config/nvim"
set -x VIMDATA   "~/.local/share/nvim"
set -x EDITOR    lvim

### asdf start 
# `asdf` instructions for fish compatability, per: https://asdf-vm.com/guide/getting-started.html#_3-install-asdf
source /usr/local/opt/asdf/libexec/asdf.fish
### asdf end 

### homebrew start
set -x HOMEBREW_PREFIX "/usr/local"
### homebrew end

fish_add_path /usr/local/sbin

### fzf start
fzf_configure_bindings --git_log=\cg --directory=\ct --history=\ch --variables=\cv --git_status=\ca --processes=\cp
### fzf end

### promt start
# nintendo joy-con blue and red 
set -g hydro_color_prompt         "00C3E3"
set -g hydro_color_error          "FF4554"
# soft yellow
set -g hydro_color_git            "E2DF70"
# grayish-blue
set -g hydro_color_duration       "5E819D"
set -g hydro_fetch                true
set -g hydro_multiline            true
set -g fish_prompt_pwd_dir_length 2
### prompt end

### Nix start
if test -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
end
### Nix end
