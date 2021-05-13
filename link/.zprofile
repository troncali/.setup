# Important for homebrew in ZSH!
eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH