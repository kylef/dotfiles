DESTDIR=$(HOME)

oh-my-zsh:
	test -d $(DESTDIR)/.oh-my-zsh || git clone git://github.com/robbyrussell/oh-my-zsh.git $(DESTDIR)/.oh-my-zsh

git-env:
	test -d $(DESTDIR)/.env || git clone https://github.com/kylef/env.git $(DESTDIR)/.env

zsh: oh-my-zsh git-env
	install $(DESTDIR)/.env/template $(DESTDIR)/.zshrc

git-vim:
	test -d $(DESTDIR)/.vim || git clone --recursive https://github.com/kylef/dotvim.git $(DESTDIR)/.vim
	mkdir -p $(DESTDIR)/.vim/autoload
	test -h $(DESTDIR)/.vim/autoload/pathogen.vim || ln -s $(DESTDIR)/.vim/bundle/pathogen/autoload/pathogen.vim $(DESTDIR)/.vim/autoload/pathogen.vim

vim: git-vim
	install $(DESTDIR)/.vim/templates/vimrc $(DESTDIR)/.vimrc
	install $(DESTDIR)/.vim/templates/gvimrc  $(DESTDIR)/.gvimrc

all: zsh vim
