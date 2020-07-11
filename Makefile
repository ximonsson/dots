# file: Makefile
# description: installs all dotfiles for the system
#
# NOTE: should change so files are not hidden in the repository and instead the created
#       symlinks are

install: bspwm bash lemonbar x picom weechat vim mutt aur zsh octave julia r tmux dunst userdirs

sxkhd:
	ln -s -T $(CURDIR)/sxhkd $(XDG_CONFIG_HOME)/sxhkd

bspwm: sxkhd
	ln -s -T $(CURDIR)/bspwm $(XDG_CONFIG_HOME)/bspwm

lemonbar:
	ln -s -T $(CURDIR)/lemonbar $(XDG_CONFIG_HOME)/lemonbar

openbox:

bash:
	ln -s -T $(CURDIR)/bash/.bashrc $(HOME)/.bashrc
	ln -s -T $(CURDIR)/bash/.bash_aliases $(HOME)/.bash_aliases

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
	mkdir $(HOME)/.vim $(XDG_CONFIG_HOME)/nvim
	ln -s -T $(CURDIR)/vim/.vimrc $(HOME)/.vimrc
	ln -s -T $(CURDIR)/vim $(HOME)/.vim
	ln -s -T $(HOME)/.vim/autoload $(XDG_CONFIG_HOME)/nvim/autoload
	ln -s -T $(CURDIR)/nvim/init.vim $(XDG_CONFIG_HOME)/nvim/init.vim

weechat:
	ln -s -T $(CURDIR)/weechat $(HOME)/.weechat

firefox:
	ln -s -T $(CURDIR)/firefox/userContent.css $(HOME)/.mozilla/firefox/$(PROFILE)/chrome/userContent.css

conky:
	ln -s -T $(CURDIR)/.conkyrc $(HOME)/.conkyrc

qutebrowser:
	ln -s -T $(CURDIR)/qutebrowser/qutebrowser.conf $(XDG_CONFIG_HOME)/qutebrowser/qutebrowser.conf

aur:
	mkdir $(XDG_CONFIG_HOME)/aur
	ln -s $(CURDIR)/aur/update $(XDG_CONFIG_HOME)/aur/update
	ln -s $(CURDIR)/aur/packages $(XDG_CONFIG_HOME)/aur/packages

mutt:
	ln -s $(CURDIR)/neomutt $(XDG_CONFIG_HOME)/neomutt
	ln -s $(XDG_CONFIG_HOME)/neomutt/neomuttrc $(HOME)/.muttrc

octave:
	ln -s $(CURDIR)/octave/.octaverc $(HOME)/.octaverc

r:
	ln -s $(CURDIR)/R/.Rprofile $(HOME)/.Rprofile

julia:
	mkdir -p $(HOME)/.julia/config
	ln -s $(CURDIR)/julia/startup.jl $(HOME)/.julia/config/startup.jl

tmux:
	ln -s $(CURDIR)/tmux/.tmux.conf $(HOME)/.tmux.conf
	ln -s $(CURDIR)/tmux/.tmux.conf.d $(XDG_CONFIG_HOME)/.tmux.conf.d

userdirs:
	ln -s $(CURDIR)/user-dirs.dirs $(XDG_CONFIG_HOME)/user-dirs.dirs
