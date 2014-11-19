all: homebrew homebrew-packages python-packages ruby-packages

osx: homebrew homebrew-packages

homebrew:
	ruby -e '$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)'

homebrew-packages:
	brew bundle Brewfile

python-packages:
	pip install -r requirements.txt

ruby-packages:
	gem install bundle
	bundle install

