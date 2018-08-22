.phony: vim
vim:
	cp vimrc ~/.vimrc
	mkdir ~/.vim
	mkdir ~/.vim/swapfiles
	mkdir ~/.vim/backupfiles

.phony: clean-vim
clean-vim:
	rm ~/.vimrc
	rm -r ~/.vim

.phony: tmux
tmux:
	cp tmux.conf ~/.tmux.conf
	echo ". `pwd`/tmux_autostart # tmux autostart" >> ~/.bashrc

.phony: clean-tmux
clean-tmux:
	rm ~/.tmux.conf
	sed -e "/# tmux autostart/d" ~/.bashrc > ~/.bashrc.new
	mv -f ~/.bashrc.new ~/.bashrc

.phony: zsh
zsh:
	echo ". `pwd`/zshrc # zshrc aux" >> ~/.zshrc

.phony: clean-zsh
clean-zsh:
	sed -e "/# zshrc aux/d" ~/.zshrc > ~/.zshrc.new
	mv -f ~/.zshrc.new ~/.zshrc

.phony: clean
clean: clean-vim clean-tmux clean-zsh

