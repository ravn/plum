# Plum. A Hydra head to support digitization workflows

[![Circle CI](https://circleci.com/gh/pulibrary/plum.svg?style=svg)](https://circleci.com/gh/pulibrary/plum)
[![Coverage Status](https://coveralls.io/repos/pulibrary/plum/badge.svg?branch=master)](https://coveralls.io/r/pulibrary/plum?branch=master)
[![Code Climate](https://codeclimate.com/github/pulibrary/plum/badges/gpa.svg)](https://codeclimate.com/github/pulibrary/plum)
[![Stories in Ready](https://badge.waffle.io/pulibrary/plum.png?label=ready&title=Ready)](https://waffle.io/pulibrary/plum)
[![Apache 2.0 License](https://img.shields.io/badge/license-Apache%202.0-blue.svg?style=plastic)](./LICENSE)


## Work Types
* ScannedResource
* MultiVolumeWork

## Dependencies

* [Redis](http://redis.io/)
    * Start Redis with `redis-server` or if you're on certain Linuxes, you can do this via `sudo service redis-server start`.
* [Kakadu](http://kakadusoftware.com/)
    * The installer doesn't work on MacOSX 10.11 (El Capitan), but the files `kdu_compress` and `libkdu_v77R.dylib` can be extracted from the download packages and used by manually installing them in `/usr/local/bin` and `/usr/local/lib` respectively.
* [Tesseract](https://github.com/tesseract-ocr/tesseract)
    * Version 3.04 is required. You can install it on Mac OSX with `brew install
      tesseract --with-all-languages` For Ubuntu you'll have to
      [compile](https://github.com/tesseract-ocr/tesseract/wiki/Compiling) it.

## Running the Code

    $ bundle install
    $ rake jetty:clean
    $ rake curation_concerns:jetty:config
    $ rake jetty:start
    $ rake db:migrate
    $ rake spec

## Adding an Admin user

1. Run Plum with `rails s`
1. Go to http://localhost:3000/users/auth/cas and login with CAS
1. $ rake add_admin_role

## Configuring Loris for Development

1. Install Docker Toolbox [https://www.docker.com/toolbox](https://www.docker.com/toolbox)
  * Only necessary for mac or windows machines. For unix boxes install via 
      `wget -qO- https://get.docker.com/ | sh`
1. Start a docker VM: `docker machine start default`
1. Setup your docker environment: `eval "$(docker-machine env default)"`
1. Retrieve the loris image: `docker pull lorisimageserver/loris`
1. Start the container:
  ```
  docker run --name loris -v /path/to/plum/tmp/derivatives:/usr/local/share/images -d -p 5004:5004 lorisimageserver/loris
  ```
1. Find the docker IP address with `docker-machine ls`
1. Export config variable for IIIF url: `export
   PLUM_IIIF_URL="http://<docker-ip>:5004"`
1. Images should be available at `http://<docker-ip>:5004/` based on the FileSet id.  e.g., if your docker IP address is 192.168.99.100, the full view of FileSet `70795765b` would be at http://192.168.99.100:5004/70%2F79%2F%2F57%2F65%2Fb-intermediate_file.jp2/full/full/0/default.jpg
