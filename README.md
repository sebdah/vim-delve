vim-delve
=========

This is a `neovim` plugin for debugging [Go](https://golang.org) applications
using [Delve](https://github.com/derekparker/delve).

Requirements
------------

- [Delve](https://github.com/derekparker/delve)
- [neovim](https://neovim.io)

Feature highlights
------------------

- Go syntax highlighting of debug output
- Supports both breakpoints and tracepoints
- Run the Delve debugger in a split view along side your code
- Launches a Delve CLI, so all commands are supported in there
- Leverages the Neovim terminal
- Supports `main` as well as and non-`main` packages

Installation
------------

Using `vim-plug`, add the following to your `init.vim`:

`Plug 'sebdah/vim-delve'`

Then reload neovim and run `PlugInstall`.

Commands
--------

- `DlvClearAll` - Clear all the breakpoints and tracepoints in the buffer.
- `DlvDebug` - Run `dlv debug` for the current session. Use this to test `main`
    packages.
- `DlvTest` - Run `dlv test` for the current session. Use this to debug
    non-`main` packages.
- `DlvToggleBreakpoint` - Toggle a breakpoint at the current line.
- `DlvToggleTracepoint` - Toggle a tracepoint at the current line.

Configuration
-------------

**Delve backend** `g:delve_backend`

Defines the backend to use with Delve.

Default: `let g:delve_backend = "default"`

**Cache path** `g:delve_cache_path`

The path to where the instructions file for `dlv` is stored.

Default: `let g:delve_cache_path = $HOME . "/.cache/" . v:progname . "/vim-delve"`

**Breakpoint sign**

Sets the sign to use to indicate breakpoints in the gutter.

Default: `let g:delve_breakpoint_sign = "◉"`

**Breakpoint sign highlight color**

Set the color profile for the sign.

Default: `let g:delve_breakpoint_sign_highlight = "WarningMsg"`

Frequently Asked Questions
--------------------------

**Got an error about `lldb-server` on Mac OS X**

If you get a message like the one below on Mac OS X, try setting
`g:delve_backend` to `native`.

```
could not launch process: exec: "lldb-server": executa ble file not found in $PATH
```

Example: `let g:delve_backend = "native"`


License
-------

MIT Licensed software.
