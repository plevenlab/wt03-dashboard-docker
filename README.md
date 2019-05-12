# wt03-dashboard-docker

This repository contains docker scripts that would deploy https://github.com/plevenlab/wt03-dashboard

## Notes:
 * Make sure you have docker, docker-compose and git installed
 * Make sure you've cloned the sub-modules by running `git submodule update --init`
	
# How to use
 * Copy the .env.example as .env and adjust it if needed
 * Run `docker-compose build` to build the images
 * Run `docker compose up -d` to run all the containers
 * By default web server should listen to 980 port