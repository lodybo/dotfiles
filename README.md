# My `.dotfiles`
version: 1.0.0-beta.1

This repo is my collection of dotfiles that I use across setups (like personal and work computers).
It's based on and heavily influenced on a number of other people's work (referenced in [credits](#credits)).

This repository is managed by [Dotbot](https://github.com/anishathalye/dotbot) which helps me install everything on each computer I work with.
The basic setup is simple: Dotbot will (on install) copy directories and symlink dotfiles on the pc that I'm running it on. These will be my shared settings, i.e. the settings I will use everywhere (like terminal settings, aliases, and such).

## Local overrides
Some configs will additionally load a local configuration file. This will then "merge" the computer-specific configuration with my shared configuration. I can have settings that I only use on my work pc without having them show up on my personal computer. This is also very handy for _super secret information_™.

The files that will look for overrides are:
- `vim` (`~/.vimrc_local`)
- `ssh` (`~/.ssh/config_local`)
- `git` (`~/.gitconfig_local`)
- `zsh` (`~/.zshrc_local`)

## Topics
My dotfiles are divided in a number of topics (an idea from [Zach Holman](https://github.com/holman/dotfiles#topical)). The top-level folders are "topics" which contain configuration. It provides a cleaner overview IMO. 

My approach differs from Zach's approach in that I don't load in `.zsh` files within each topic into my shell environment. I use [Oh My Zsh's customization options](https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-internals) that allow me to provide any shell scripts in a `custom/` folder which it will load into my environment. It's also the home of my custom functions and the external plugins I want to load into Oh My Zsh.
I then set Oh My Zsh' custom folder to `.dotfiles/oh-my-zsh/custom` so that I don't have to copy those files and can keep it up to date in my repo.

With all that said, these are the topics currently available:
- `bin`: for all (cross-platform) binaries that I want to run (e.g. [exa](https://the.exa.website/)).
- `git`: for my git configuration and commit templates.
- `ssh`: for "global" SSH configuration that I wanna have.
- `vim`: for my Vim configuration.
- `oh-my-zsh`: for my custom theme and the home of the `custom` folder with my aliases, functions and plugins.
- `zsh`: for my Zsh configration.

### npm
There is also a step that will install npm binaries globally (like `rimraf` which I use all the time). The list for this is in `install.conf.yaml`.

## Getting up and running
In order to set all of this up you need to have a system set up running the following:
- zsh
- oh-my-zsh
- git
- curl (or wget)
- python

### Installing dependencies
The first step is to install these dependencies before we can go any further:
```shell
# Update packages
apt update -y

# Install needed stuff
apt install zsh git curl python

# Also install Oh My Zsh and nvm beforehand so that we can restart the shell.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Source nvm and install latest Node LTS
. ~/.zshrc
nvm install --lts
```

### Cloning this repo
The next step is to go into the `/home/` folder and clone the repository. I'd like to put it into a dotfolder.

```shell
cd ~
git clone https://github.com/lodybo/dotfiles.git .dotfiles
```

### Run install
After that, we'll `cd` into our folder and start the install script:

```shell
cd .dotfiles
./install
```

## Credits
Like mentioned earlier, my dotfiles are heavily influenced/based on other people's dotfiles repositories.
They're marked below:

* [anishathalye](https://github.com/anishathalye/dotfiles): because of his work on Dotbot and his [explanatory blog post](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/) which got this whole circus starting, and for some inspiration for my dotfiles.
* [holman](https://github.com/holman/dotfiles): because dividing my dotfiles in topics seemed like a very good idea, and for some inspiration for my dotfiles.
* [caarlos0](https://github.com/caarlos0/dotfiles): for inspiration for my dotfiles.
* [zvory](https://github.com/zvory/dotfiles): for inspiration for my dotfiles and handling cross-platform binaries (like `bat` and `exa`).

Other people I want to credit for their contributions:
* [amix](https://github.com/amix/vimrc): for a very concise Vim setup. I used the basic configuration.
* [simonista](https://gist.github.com/simonista/8703722): for any additional Vim configuration.

## Contributing
Since this repo is essentially always present on my development machines AND in use, development can be considered "always on going".

However, there is a way to test this repo in a new linux install, with Docker.

### Testing in Docker
Docker is an excellent tool to test the effects of this repo with. For my convience, a `Dockerfile` is included in the repo. This will set up a basic environment, based on Ubuntu, installing the necessary dependencies (including Vim, for editing), creating a user called `tester`, and adding the current repo as `/home/tester/.dotfiles`.

You can build the `Dockerfile` thusly:

```shell
docker build . -t dotfiles-test
```

You can run it thusly:

```shell
docker run --rm -it dotfiles-test
```

If you're lazy, like I am, you can run `run-docker-test`:

```shell
./run-docker-test
```