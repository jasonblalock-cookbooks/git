Testing
=======

## Installing the Requirements

You must have [VirtualBox](https://www.virtualbox.org/manual/ch02.html)&[Vagrant](https://www.vagrantup.com/docs/installation/) or [Docker](https://docs.docker.com/engine/installation/) installed.

It's also recommend to install [ChefDK](https://downloads.chef.io/chef-dk/):

    $ curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -c current -P chefdk
    $ eval "$(/opt/chefdk/bin/chef shell-init bash)"
