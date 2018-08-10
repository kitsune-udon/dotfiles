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

.phony: clean
clean: clean-vim

