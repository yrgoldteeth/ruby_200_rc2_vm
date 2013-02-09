# Ruby 2.0.0 rc2 Vagrant VM

This bootstraps an ubuntu precise box, grabs the code for [Ruby
2.0.0-rc2](http://www.ruby-lang.org/en/news/2013/02/08/ruby-2-0-0-rc2-is-released/)
installs it and also grabs the newest Rubygems and installs it.

## Installation

1. Have [Vagrant](http://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/) installed
2. Clone this repository and `cd` into the directory
3. Run `vagrant box add precise32 http://files.vagrantup.com/precise32.box`
4. Run `vagrant up`
