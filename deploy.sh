#!/bin/bash

# Print the steps into a log file
exec &> >(tee deploy.log)

# Stop the service first
sudo /usr/bin/systemctl stop mattesmohr

# Delete the previous build folder
rm -rf .build

# Rebuild the project
/usr/local/bin/swift build -c release

# Delete all other source files
rm -rf .github
rm -rf Sources
rm -rf Tests
rm -rf Package.resolved
rm -rf Package.swift
rm -rf README.md
rm -rf .gitignore
rm -rf deploy.sh

# Start the service again
sudo /usr/bin/systemctl start mattesmohr
