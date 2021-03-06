# Geo Concerns w/ Hyrax
[![Build Status](https://img.shields.io/travis/projecthydra-labs/geo_works/master.svg)](https://travis-ci.org/projecthydra-labs/geo_works)
[![Coverage Status](https://img.shields.io/coveralls/projecthydra-labs/geo_works/master.svg)](https://coveralls.io/github/projecthydra-labs/geo_works?branch=master)
[![API Docs](http://img.shields.io/badge/API-docs-blue.svg)](http://www.rubydoc.info/github/projecthydra-labs/geo_works)
[![Gem Version](https://img.shields.io/gem/v/geo_works.svg)](https://github.com/projecthydra-labs/geo_works/releases)
[![Slack Status](http://slack.projecthydra.org/badge.svg)](https://project-hydra.slack.com/messages/geomodeling/)

Rails application for developing Hydra Geo models. Built around Curation Concerns engine.

* [Poster from Hydra Connect 2015](https://drive.google.com/file/d/0B5fLh2mc4FCbOUpWaTFOVmI4Nkk/view?pli=1)
* [Current GeoWorks diagram](https://wiki.duraspace.org/download/attachments/69012114/pcdm-geo-model.pdf?version=1&modificationDate=1463590066822&api=v2)


## Dependencies

1. Solr
1. [Fedora Commons](http://www.fedora-commons.org/) digital repository
1. A SQL RDBMS (MySQL, PostgreSQL), though **note** that SQLite will be used by default if you're looking to get up and running quickly
1. [Redis](http://redis.io/), a key-value store
1. [ImageMagick](http://www.imagemagick.org/) with JPEG-2000 support
1. [GDAL](http://www.gdal.org/)
    * You can install it on Mac OSX with `brew install gdal`.
    * On Ubuntu, use `sudo apt-get install gdal-bin`.
1. [GeoServer](http://geoserver.org/) (Optional)

## Simple Tiles

GeoWorks requires the image generation library [Simple Tiles](http://propublica.github.io/simple-tiles/).

Mac OS X:

- Install via Homebrew: ```brew install simple-tiles```

Linux:

- Install dependencies:

  ```
  libgdal-dev
  libcairo2-dev
  libpango1.0-dev 
  ```

- Compile:
	
  ```
  $ git clone git@github.com:propublica/simple-tiles.git
  $ cd simple-tiles
  $ ./configure
  $ make && make install
  ```

## Installation

Create and run a new GeoWorks application from a template:

```
$ rails new app-name -m https://raw.githubusercontent.com/projecthydra-labs/geo_works/master/template.rb
$ cd app-name
$ rake hydra:server
```

Add GeoWorks models to an existing Hyrax application:

1. Add `gem 'geo_works'` to your Gemfile.
1. `bundle install`
1. `rails generate hyrax:install`
1. `rails generate geo_works:install -f`

## Development

1. `bundle install`
2. `rake engine_cart:generate`
3. `rake geo_works:dev_servers`

## Testing

3. `rake ci`

To run tests separately:

```
$ rake geo_works:test_servers
```

Then, in another terminal window:

```
$ rake spec
```
To run a specific test:

```bash
rspec spec/path/to/your_spec.rb:linenumber
```

## Running GeoServer for Development with Docker

### MacOS

1. Make sure you have docker engine, docker-machine, and docker-compose installed.
   - Docker Toolbox: [https://www.docker.com/products/docker-toolbox](https://www.docker.com/products/docker-toolbox)

1. Execute the following command in the geo_works directory:
   
   ```
   $ source ./run-docker.sh
   ```
1. To stop the server and remove port forwarding:

	```
	$ docker-compose stop
	$ killall ssh
	```

### Linux

1. Make sure you have docker engine and docker-compose installed.
   - [https://docs.docker.com/engine/installation/linux/](https://docs.docker.com/engine/installation/linux/)
   - [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

1. Execute the following commands in the geo_works directory:

	```
	$ docker-compose up -d
	```

## Running GeoServer for Development with Vagrant

1. Make sure you have VirtualBox and Vagrant installed.
	- [https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
	- [https://www.vagrantup.com/docs/installation/](https://www.vagrantup.com/docs/installation/)
1. Execute the following commands:
	
	```
	$ git clone https://github.com/GeoWorks/geoserver-vagrant.git
	$ cd geoserver-vagrant/
	$ vagrant up
	
	```
