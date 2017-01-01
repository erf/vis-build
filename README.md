# vis-build 

A Lua plugin for compiling single files in the [vis editor](https://github.com/martanne/vis).

Supported languages:
- c
- swift
- rust
- crystal
- haskell

# configure
1. `ln -s build.lua .config/vis/plugins`
2. `require('plugins/build')` in `visrc.lua`

# usage
Press `<Ctrl-b>` or use the `:build` command to build the current file.

# TODO
- stderr, stdout > vis:message
- `run` command
- more languages