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

.phony: clean
clean: clean-vim clean-tmux

