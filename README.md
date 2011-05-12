# nodejs-pkg-tools

Tools for building Debian Node.js packages.

# How it works

This script runs `npm install -g` and moves the results into the
Debian package. In the future, you will be able to tell it not to
bundle certain dependencies (by default, it will).

## Example debian/rules

    #!/usr/bin/make -f

    include /usr/share/cdbs/1/rules/debhelper.mk
    include /usr/share/nodejs-pkg-tools/1/class/node-npm.mk

## TODO

- Make it possible to not bundle dependencies.
- Symlink ./bin files into /usr/bin.
- Symlink man files.
