# Installation

These installation steps are pretty biased towards my work situation. There are a number of useful links included in this repository for things like shell scripting and setting up SSH keys.

- Go into the App Store and install all updates

- Install the Command Line Tools:

```
$ xcode-select --install
```

- Install NVM (Node Version Manager). This is just a sample command. Go to https://github.com/creationix/nvm#install-script to find the latest version.

```
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
```

- Clone and install dotfiles. Be sure to edit `bash_profile.symlink` to reference the correct "DOTFILES" export directory.

```
$ ./dotfiles.sh install
```

- Setup SSH keys

- Add SSH key to Github (hint: use new "pubkey" alias)

- Add SSH key to Bitbucket (hint: use new "pubkey" alias)

- Create project directory

```
$ cd ~ && mkdir Project
```

- Install Homebrew

```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Install AWS Command Line Interface

```
$ brew install awscli
```

To configure, enter:

```
$ aws configure
```

Enter the following at the prompts:

```
AWS Access Key ID [None]: <KEY>
AWS Secret Access Key [None]: <SECRET>
Default region name [None]: us-east-1
Default output format [None]: table
```

[Optional] Install "shellcheck" via Homebrew to lint/find bugs in shell scripts

```
brew install shellcheck
```

- Install Docker (https://docs.docker.com/docker-for-mac/install/#download-docker-for-mac) and log into JFrog

```
$ docker login fieldlens-docker-dev-local.jfrog.io
```

## Inspiration

- https://github.com/holman/dotfiles