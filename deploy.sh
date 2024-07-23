#!/bin/bash

# Print the steps into a log file
exec &> >(tee deploy_log.log)

# Delete the previous build folder
if [ -d .build ]
then
rm -rf .build
fi

# Rebuild the project
/usr/share/swift/usr/bin/swift build -c release

# Delete all other source files
if [ -d .github ]
then
rm -rf .github
fi

if [ -d Sources ]
then
rm -rf Sources
fi

if [ -d Tests ]
then
rm -rf Tests
fi

if [ -f Package.resolved ]
then
rm -rf Package.resolved
fi

if [ -f Package.swift ]
then
rm -rf Package.swift
fi

if [ -f README.md ]
then
rm -rf README.md
fi

if [ -f .gitignore ]
then
rm -rf .gitignore
fi

# Delete the deploy script
if [ -f deploy.sh ]
then
rm -rf deploy.sh
fi
