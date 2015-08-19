#compdef aws-keychain

# Zsh completion for aws-keychain.
# Copy to a directory in your $fpath as a file named `_aws-keychain`

__subcommands() {
  local -a commands
  commands=(
  "add:add a new key to the keychain"
  "exec:excute a command with AWS key in environment"
  "ls:lists known keys"
  "rm:delete a key from the keychain"
  )
  _describe "aws-keychain subcommands" commands
}

__key_names() {
  _alternative "keys:key names:($(aws-keychain ls))"
}

if (( CURRENT == 2 )); then
  __subcommands
  return
fi

if (( CURRENT == 3 )); then
  case "${words[2]}" in
    rm|exec) __key_names ;;
  esac
fi
