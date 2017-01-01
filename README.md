# vis-build 

A Lua plugin for compiling single `c` or `swift` files in the [vis editor](https://github.com/martanne/vis).

# configure
1. `ln -s build.lua .config/vis/plugins`
2. `require('plugins/build')` in `visrc.lua`

# usage
Press `<Ctrl-b>` or use the `:build` command to build the current `c` or `swift` file.

# TODO
- stderr > vis:message
- RUN command. stdout > vis:message
- more languages?