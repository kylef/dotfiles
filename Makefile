PIP=PIP_REQUIRE_VIRTUALENV=false pip

BREW=/usr/local/bin/brew
BREW_BUNDLE=/usr/local/Homebrew/Library/Taps/homebrew/homebrew-bundle

all: .swiftenv
osx: homebrew-packages python-packages all

$(BREW):
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

$(BREW_BUNDLE): $(BREW)
	brew tap Homebrew/bundle

.PHONY: homebrew-packages
homebrew-packages: $(BREW_BUNDLE)
	brew bundle

.PHONY: python-packages
python-packages: /usr/local/bin/virtualenv /usr/local/bin/rfc

/usr/local/bin/virtualenv:
	$(PIP) install virtualenv

/usr/local/bin/rfc:
	$(PIP) install rfc

.swiftenv:
	git clone https://github.com/kylef/swiftenv .swiftenv

fish:
	@chsh -s $(shell which fish)
