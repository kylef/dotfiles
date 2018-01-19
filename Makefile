PIP=PIP_REQUIRE_VIRTUALENV=false pip

BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle

OS := $(shell uname)

all: $(OS) vim-packages fish-packages

Darwin: homebrew-packages
Linux:

$(BREW):
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

.PHONY: homebrew-packages
homebrew-packages: $(BREW_BUNDLE)
	brew bundle

.PHONY: vim-packages
vim-packages:
	@vim -c PlugUpgrade -c PlugInstall -c qall

fish:
	@chsh -s $(shell which fish)

.PHONY: fish-packages
fish-packages:
	@fish -c fisher
