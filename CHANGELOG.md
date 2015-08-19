## Changelog for aws-keychain

# v2.0.0 2015-08-18

This release focuses on simplifying the interface and never storing credentials unencrypted to disk. Instead `aws-keychain exec <name> <cmd ...>` becomes the primary mode of operation.

* Removed subcommands relating to unencrypted credential file: `use`, `none`, `status`, `cat`.
* Removed `env` subcommand deprecated in v1.0.0.


# v1.0.0 2015-08-18

* `aws-keychain exec <name> <cmd ...>` added in #10
  * Use this instead of `aws-keychain use` etc to keep credentials off disk.
* `aws-keychain rm` secure credential file deletion in #11
* Zsh completion in 011a2a516a02e41d6b720e3e4201acef01cc4406
* `aws-keychain add <name>` interactive prompt in #9
* Updated credential file format in #7
* `aws-keychain env` deprecated in favor of `aws-keychain exec`.


# v0.0.1 2014-11-06

* Initial implementation;

    aws-keychain add <name> <access_key_id> <secret_access_key>
    aws-keychain cat <name>
    aws-keychain env <name>
    aws-keychain ls
    aws-keychain none
    aws-keychain rm <name>
    aws-keychain status
    aws-keychain use <name>
    eval `aws-keychain env <name>`
