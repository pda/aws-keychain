#compdef aws-keychain

# Zsh completion for aws-keychain.
# Copy to a directory in your $fpath as a file named `_aws-keychain`

__subcommands() {
  local -a commands
  commands=(
  "add:add a new key to the keychain"
  "cat:output an key in credentials file format"
  "env:output an key as shell exports for eval"
  "ls:lists known keys"
  "none:erase the current credentials file"
  "rm:delete a key from the keychain"
  "status:show the key ID currently active in credentials file"
  "use:use the named key; write to credentials file"
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
    cat|env|rm|use) __key_names ;;
  esac
fi
