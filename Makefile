# file: Makefile
# description: installs all dotfiles for the system
#
# NOTE: should change so files are not hidden in the repository and instead the created
#       symlinks are
#

DIR=$(XDG_CONFIG_HOME)

install: bspwm bash lemonbar x dunst compton weechat vim

sxkhd:
	ln -s -T $(CURDIR)/sxkhd $(DIR)/sxkhd

bspwm: sxkhd
	ln -s -T $(CURDIR)/bspwm $(DIR)/bspwm

lemonbar:
	ln -s -T $(CURDIR)/lemonbar $(DIR)/lemonbar

openbox:

bash:
	ln -s -T $(CURDIR)/bash/.bashrc $(HOME)/.bashrc
	ln -s -T $(CURDIR)/bash/.bash_aliases $(HOME)/.bash_aliases

x:
	ln -s -T $(CURDIR)/Xresources $(HOME)/.Xresources
	ln -s -T $(CURDIR)/.xinitrc $(HOME)/.xinitrc
	ln -s -T $(CURDIR)/.xprofile $(HOME)/.xprofile
	ln -s -T $(CURDIR)/x $(DIR)/x

dunst:
	ln -s -T $(CURDIR)/dunst $(DIR)/dunst

compton:
	ln -s -T $(CURDIR)/compton.conf $(HOME)/compton.conf

vim:
	mkdir $(HOME)/vim $(DIR)/nvim
	ln -s -T $(CURDIR)/vim/.vimrc $(HOME)/.vimrc
	ln -s -T $(CURDIR)/vim $(HOME)/vim
	ln -s -T $(CURDIR)/nvim $(DIR)/nvim

weechat:
	ln -s -T $(CURDIR)/weechat $(HOME)/weechat

firefox:
	ln -s -T $(CURDIR)/firefox/userContent.css $(HOME)/.mozilla/firefox/$(PROFILE)/chrome/userContent.css

conky:
	ln -s -T $(CURDIR)/.conkyrc $(HOME)/.conkyrc

qutebrowser:
	ln -s -T $(CURDIR)/qutebrowser/qutebrowser.conf $(DIR)/qutebrowser/qutebrowser.conf

