aws-keychain
============

The aim of `aws-keychain` is to run commands that require AWS credentials
without ever storing those credentials unencrypted on disk. Mac OS X's keychain
is used for storage, and credentials are passed to commands via the well known
environment variables that all tools look for.

```
aws-keychain    (c) 2014-2015 Paul Annesley    MIT license.

Store multiple AWS IAM access keys in Mac OS X keychain.
Check out one of them at a time into ~/.aws/credentials

Manage access keys in Keychain:
  aws-keychain add <name> <access_key_id> <secret_access_key>
  aws-keychain add <name> # (interactive prompt for key and secret)
  aws-keychain ls
  aws-keychain exec <name> <command ... >
  aws-keychain rm <name>
```

Install
-------

Copy/symlink `aws-keychain` to somewhere in your path.

```sh
ln -s $(pwd)/aws-keychain /usr/local/bin
```

If you're using Zsh, copy/symlink `aws-keychain-completion.zsh` to `_aws-keychain` in an `$fpath` directory:

```sh
ln -s $(pwd)/aws-keychain-completion.zsh /usr/local/share/zsh/site-functions/_aws-keychain
```


Example
-------

```sh
# beware shell history
$ aws-keychain add personal AKILNNK8O1KFMIZRQY1J QURSltVBG33e1qUxVhtsDw

$ aws-keychain add work
Access Key ID: AKIJA9JFOPAKMH9AJPCJ
Secret Access Key (hidden): ********

$ aws-keychain ls
personal
work

$ aws-keychain exec personal aws s3 ls
2012-08-22 13:56:43 some-bucket-name
2014-02-12 19:12:31 another-bucket

$ aws-keychain rm work
password has been deleted.

$ aws-keychain ls
personal
```
