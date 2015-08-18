aws-keychain
============

```
aws-keychain    (c) 2014-2015 Paul Annesley    MIT license.

Store multiple AWS IAM access keys in Mac OS X keychain.
Check out one of them at a time into ~/.aws/credentials

Manage access keys in Keychain:
  aws-keychain add <name> <access_key_id> <secret_access_key>
  aws-keychain add <name> # (interactive prompt for key and secret)
  aws-keychain ls
  aws-keychain exec <name> <command ... >
  aws-keychain cat <name>
  aws-keychain rm <name>
  aws-keychain use <name>
  aws-keychain status
  aws-keychain none
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

```
$ aws-keychain status
No access key at /Users/example/.aws/credentials

$ aws-keychain ls
cat: /Users/example/.aws/aws-keychain.list: No such file or directory

$ aws-keychain add personal AKILNNK8O1KFMIZRQY1J QURSltVBG33e1qUxVhtsDw

$ aws-keychain add work AKIJA9JFOPAKMH9AJPCJ LBCoZPXfQNVNRJbwN92pFQ

$ aws-keychain ls
personal
work

$ aws-keychain exec personal aws s3 ls

$ aws-keychain use personal

$ aws-keychain status
personal: AKILNNK3OPAKMIZRQY1J

$ aws-keychain rm work
password has been deleted.

$ aws-keychain ls
personal

$ aws-keychain none
$ aws-keychain status
No access key at /Users/example/.aws/credentials

$ aws-keychain ls
personal
```
