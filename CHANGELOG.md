## Changelog for aws-keychain

# v3.0.0 2015-09-22

This release focuses on better Keychain security;

* Prevent `security` / `aws-keychain` from being whitelisted to access Keychain items. https://github.com/pda/aws-keychain/pull/13
* Store in a separate `aws-keychain.keychain` instead of the always-unlocked `login.keychain`. https://github.com/pda/aws-keychain/pull/15
    * Override with `AWS_KEYCHAIN_FILE` environment variable.
    * `aws-keychain migrate` moves items from `login.keychain` to `aws-keychain.keychain`.

Keychain Access (which ships with Mac OS X) can be used to adjust the auto-lock parameters on the new keychain file. It is recommended that you don't “Always allow” when prompted. You can hit spacebar to allow access when prompted while the keychain is unlocked.


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
