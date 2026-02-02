# file: Makefile
# description: installs all dotfiles for the system
#
# NOTE: should change so files are not hidden in the repository and instead the created
#       symlinks are

install: bspwm bash lemonbar x picom weechat nvim mutt aur zsh julia tmux dunst userdirs ruff

sxkhd:
	ln -s -T $(CURDIR)/sxhkd $(XDG_CONFIG_HOME)/sxhkd

bspwm: sxkhd
	ln -s -T $(CURDIR)/bspwm $(XDG_CONFIG_HOME)/bspwm

lemonbar:
	ln -s -T $(CURDIR)/lemonbar $(XDG_CONFIG_HOME)/lemonbar

zsh:
	ln -s $(CURDIR)/zprofile $(HOME)/.zprofile
	ln -s $(CURDIR)/zshrc $(HOME)/.zshrc

x:
	ln -s -T $(CURDIR)/.Xresources $(HOME)/.Xresources
	ln -s -T $(CURDIR)/.xinitrc $(HOME)/.xinitrc
	ln -s -T $(CURDIR)/.xprofile $(HOME)/.xprofile
	ln -s -T $(CURDIR)/Xresources.d $(XDG_CONFIG_HOME)/.Xresources.d


$(XDG_CONFIG_HOME)/dunst:
	ln -s -T $(CURDIR)/dunst $@

dunst: $(XDG_CONFIG_HOME)/dunst

picom:
	ln -s -T $(CURDIR)/picom.conf $(XDG_CONFIG_HOME)/picom.conf

vim:
	mkdir $(HOME)/.vim
	ln -s -T $(CURDIR)/vim/.vimrc $(HOME)/.vimrc
	ln -s -T $(CURDIR)/vim $(HOME)/.vim

nvim: vim
	mkdir -p $(XDG_CONFIG_HOME)/nvim
	ln -sf -T $(CURDIR)/nvim/init.lua $(XDG_CONFIG_HOME)/nvim/init.lua
	ln -sf -T $(HOME)/.vim/autoload $(XDG_CONFIG_HOME)/nvim/autoload

weechat:
	ln -s -T $(CURDIR)/weechat $(HOME)/.weechat

firefox:
	ln -s -T $(CURDIR)/firefox/userContent.css $(HOME)/.mozilla/firefox/$(PROFILE)/chrome/userContent.css

aur:
	mkdir $(XDG_CONFIG_HOME)/aur
	ln -s $(CURDIR)/aur/update $(XDG_CONFIG_HOME)/aur/update

mutt:
	ln -s $(CURDIR)/neomutt $(XDG_CONFIG_HOME)/neomutt
	ln -s $(XDG_CONFIG_HOME)/neomutt/neomuttrc $(HOME)/.muttrc

julia:
	mkdir -p $(HOME)/.julia/config
	ln -s $(CURDIR)/julia/startup.jl $(HOME)/.julia/config/startup.jl

tmux:
	ln -s $(CURDIR)/tmux/.tmux.conf $(HOME)/.tmux.conf
	ln -s $(CURDIR)/tmux/.tmux.conf.d $(XDG_CONFIG_HOME)/.tmux.conf.d

userdirs:
	ln -s $(CURDIR)/user-dirs.dirs $(XDG_CONFIG_HOME)/user-dirs.dirs

ruff:
	sudo pacman -S ruff ruff-lsp
	mkdir -p $(XDG_CONFIG_HOME)/ruff
	ln -sf $(CURDIR)/ruff/pyproject.toml $(XDG_CONFIG_HOME)/ruff/pyproject.toml

.PHONY: ruff nvim vim x warpgate

# Warpgate
# ---

$(XDG_CONFIG_HOME)/systemd/user/warpgate.service: warpgate/warpgate.service
	ln -s -f -t $(XDG_CONFIG_HOME)/systemd/user/ $(CURDIR)/warpgate/warpgate.service

warpgate:
	MISTRAL_API_KEY=$$(pass mistral.ai/simonsson.simon@gmail.com | grep f00: | awk '{ print $$2 }') \
	CODESTRAL_API_KEY=$$(pass mistral.ai/simonsson.simon@gmail.com | grep CODESTRAL_API_KEY: | awk '{ print $$2 }') \
	nerdctl compose up warpgate


# NOT USED
# -------

qutebrowser:
	ln -s -T $(CURDIR)/qutebrowser/qutebrowser.conf $(XDG_CONFIG_HOME)/qutebrowser/qutebrowser.conf

octave:
	ln -s $(CURDIR)/octave/.octaverc $(HOME)/.octaverc

r:
	ln -s $(CURDIR)/R/.Rprofile $(HOME)/.Rprofile

conky:
	ln -s -T $(CURDIR)/.conkyrc $(HOME)/.conkyrc

bash:
	ln -s -T $(CURDIR)/bash/.bashrc $(HOME)/.bashrc
	ln -s -T $(CURDIR)/bash/.bash_aliases $(HOME)/.bash_aliases
