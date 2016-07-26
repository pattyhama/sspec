# sspec
[![Build Status](https://travis-ci.org/pattyhama/sspec.svg?branch=master)](https://travis-ci.org/pattyhama/sspec)

What is this
--------

Example of Continuous Integration(CI) using Chef, Serverspec and Travis CI.
- Server is provisioned with Chef and tested with Serverspec, Foodcritic, Rubocop.
- Refer to `travis.yml` for the test flow
- After server is created, notification will be pushed to Slack and the built Docker Image is pushed to Docker Hub.

What is built from this project
--------
- OS:
 - Ubuntu Server 16.04
- Installed Package:
 - Apache2
 - Basic packages
   - vim, traceroute, net-tools (from apt)
   - pry (from gem)
- Running Condition:
 - Apache2 is run at the start, listening port 80
