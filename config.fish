if status is-interactive
    # Commands to run in interactive sessions can go here
end

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
set -U EDITOR nvim

nvm use v16.11 1> /dev/null

function re_source
    source ~/.config/fish/config.fish
end


# fzf start
fzf_configure_bindings --git_log=\cg --directory=\ct --history=\ch --variables=\cv --git_status=\ca --processes=\cp
#fzf end

# nintendo joy-con blue and red 
set -g hydro_color_prompt "00C3E3"
set -g hydro_color_error  "FF4554"
# soft yellow
set -g hydro_color_git            "E2DF70"
set -g hydro_fetch                true
set -g hydro_multiline            true
set -g fish_prompt_pwd_dir_length 2
