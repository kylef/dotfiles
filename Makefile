PIP=PIP_REQUIRE_VIRTUALENV=false pip

all: .swiftenv
osx: homebrew-packages python-packages all

/usr/local/bin/brew:
	@echo Installing Homebrew
	@ruby -e "`curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install`"

/usr/local/Library/Taps/homebrew/homebrew-bundle: /usr/local/bin/brew
	brew tap Homebrew/bundle

.PHONY: homebrew-packages
homebrew-packages: /usr/local/Library/Taps/homebrew/homebrew-bundle
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
