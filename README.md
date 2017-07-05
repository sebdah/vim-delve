vim-delve
=========

This is a `neovim` plugin for debugging [Go](https://golang.org) applications
using [Delve](https://github.com/derekparker/delve).

Requirements
------------

- [Delve](https://github.com/derekparker/delve)
- [Neovim](https://neovim.io)

Commands
--------

- `DelveToggleBreakpoint` - Toggle a breakpoint at the current line
- `DelveDebug` - Run `dlv debug` for the current session
- `DelveTest` - Run `dlv test` for the current session

Configuration
-------------

**Delve backend** `g:delve_backend`

Defines the backend to use with Delve.

Default: `let g:delve_backend = "default"`

**Cache path** `g:delve_cache_path`

The path to where the instructions file for `dlv` is stored.

Default:

`let g:delve_cache_path = $HOME . "/.cache/" . v:progname . "/vim-delve"`


License
-------

MIT Licensed software.
