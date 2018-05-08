#!/bin/bash
echo "updating submodule"
git submodule foreach git pull origin master
