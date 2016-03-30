#compdef aws-keychain

# Bash completion for aws-keychain.
# Source the file

_aws_keychain() {
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  if [[ ${COMP_CWORD} == 1 ]]; then
    opts="add exec ls rm"
    COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
  elif [[ ${COMP_CWORD} == 2 ]]; then
    case $prev in
      'exec'|'rm')
        opts=$(aws-keychain ls)
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}"))
        ;;
    esac
  fi
}

complete -F _aws_keychain aws-keychain

