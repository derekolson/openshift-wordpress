# openshift-wordpress

This project combines the ideas of *VagrantPress* and openshift-wordpress-quickstart to get a wordpress blog running on the openshift cloud as well as a local vagrant vm development environment.

# What's Installed

+ Ubuntu Trusty (14.04)
+ wordpress latest stable (4.1)
+ mysql
+ php
+ phpmyadmin
+ PEAR

# Prerequisites

+ [Openshift Client Tools](https://developers.openshift.com/en/managing-client-tools.html)
+ [Vagrant](http://www.vagrantup.com/downloads.html)
+ [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

## Getting Started

This is a fairly simple project to get up and running.  
The procedure for starting up a working WordPress is as follows:

1. Clone the project.  (There’s only master branch.)
2. Run the command `vagrant up` from the directory
3. Open your browser to http://localhost:8080

## Working with the environment

To log in to the local Wordpress installation:

`http://localhost:8080/wp-admin/`

You can access phpMyAdmin:

`http://localhost:8080/phpmyadmin/` with username `wordpress`, password `wordpress`.

## A Few Details

* If you're needing a password (for anything - including mysql, it should be `vagrant`)

## Getting Help

Feel free to file an issue, or create a pull request.
