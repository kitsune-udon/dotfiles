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

.phony: clean-tmux
clean-tmux:
	rm ~/.tmux.conf

.phony: clean
clean: clean-vim clean-tmux

