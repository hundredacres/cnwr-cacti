# cacti

[![Build Status](https://travis-ci.org/garrettrowell/puppet-cacti.svg?branch=master)](https://travis-ci.org/garrettrowell/puppet-cacti)
[![Coverage Status](https://coveralls.io/repos/garrettrowell/puppet-cacti/badge.svg?branch=master&service=github)](https://coveralls.io/github/garrettrowell/puppet-cacti?branch=master)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with cacti](#setup)
    * [What cacti affects](#what-cacti-affects)
      * [Installed Packages](#installed-packages)
      * [Managed Services](#managed-services)
      * [Managed Files](#managed-files)
    * [Beginning with cacti](#beginning-with-cacti)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)
7. [Release Notes - Changelog](#release-notes)

## Overview

Installs Cacti and manages all of its dependencies.

## Module Description

The Cacti module installs, configures, and manages all of Cacti's dependencies.

Uses the [puppetlabs-mysql](https://github.com/puppetlabs/puppetlabs-mysql) module to install, manage, and configure mariadb for use with cacti.

Uses [rmueller-cron](https://github.com/roman-mueller/rmueller-cron) to manage /etc/cron.d/cacti.


## Setup

### What cacti affects

#### Installed Packages

* httpd
* httpd-devel
* mariadb-server
* php-mysql
* php-pear
* php-common
* php-gd
* php-devel
* php
* php-mbstring
* php-cli
* php-snmp
* net-snmp-utils
* net-snmp-libs
* rrdtool

#### Managed Services

* httpd
* mariadb
* snmpd

#### Managed Files
* `/etc/cacti/db.php`
* `/etc/httpd/conf.d/cacti.conf`
* `/etc/cron.d/cacti`

### Beginning with cacti
To get started using the cacti module with default settings use:

`include ::cacti`

The following should be defined in hiera since no defaults are provided:

* `cacti::database::root_pass` - MariaDB password used by the root user

* `cacti::database::pass` - MariaDB password used by the cacti user

## Usage

The following can be changed from their defaults by specifying values in hiera:

* `cacti::database::root_pass` - The database password for the root user
* `cacti::database::type` - The type of database used - DEFAULTS to "mysql"
* `cacti::database::default` - The database used by cacti - DEFAULTS to "cacti"
* `cacti::database::host` - The hostname where the database in installed - DEFAULTS to "localhost"
* `cacti::database::user` - The database user that cacti uses - DEFAULTS to "cacti"
* `cacti::database::pass` - The database password for the cacti user
* `cacti::database::port` - The port that the database is listening on - DEFAULTS to "3306"
* `cacti::database::ssl` - Use SSL for database communication - DEFAULTS to "false"

## Limitations

Currently only the following Operating Systems are supported:

* RHEL 7
* CentOS 7

## Development

If you wish to contribute to this module please either add an [issue](https://github.com/garrettrowell/puppet-cacti/issues) or better yet submit a [Pull Request](https://github.com/garrettrowell/puppet-cacti/pulls)

## Release Notes

### Version 0.0.1
* Initial release
