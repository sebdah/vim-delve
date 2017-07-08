vim-delve
=========

This is a `neovim` plugin for debugging [Go](https://golang.org) applications
using [Delve](https://github.com/derekparker/delve).

Feature highlights
------------------

- Go syntax highlighting of debug output
- Supports both breakpoints and tracepoints
- Run the Delve debugger in a split view along side your code
- Launches a Delve CLI, so all commands are supported in there
- Leverages the Neovim terminal
- Supports `main` as well as and non-`main` packages

![animated example](https://github.com/sebdah/vim-delve/raw/master/vim-delve-demo.gif "vim-delve demo")

Requirements
------------

- [Delve](https://github.com/derekparker/delve)
- [neovim](https://neovim.io)

Installation
------------

Using `vim-plug`, add the following to your `init.vim`:

`Plug 'sebdah/vim-delve'`

Then reload neovim and run `PlugInstall`.

Commands
--------

- `DlvAddBreakpoint` - Add a breakpoint at the current line.
- `DlvAddTracepoint` - Add a tracepoint at the current line.
- `DlvAttach <pid>` - Attach `dlv` to a running process.
- `DlvClearAll` - Clear all the breakpoints and tracepoints in the buffer.
- `DlvDebug` - Run `dlv debug` for the current session. Use this to test `main` packages.
- `DlvRemoveBreakpoint` - Remove the breakpoint at the current line.
- `DlvRemoveTracepoint` - Remove the tracepoint at the current line.
- `DlvTest` - Run `dlv test` for the current session. Use this to debug non-`main` packages.
- `DlvToggleBreakpoint` - Convenience method to toggle (add or remove) a breakpoint at the current line.
- `DlvToggleTracepoint` - Convenience method to toggle (add or remove) a tracepoint at the current line.

Configuration
-------------

### Delve backend (`g:delve_backend`)

Defines the backend to use with Delve.

Default: `let g:delve_backend = "default"`

### Cache path (`g:delve_cache_path`)

The path to where the instructions file for `dlv` is stored.

Default: `let g:delve_cache_path = $HOME . "/.cache/" . v:progname . "/vim-delve"`

### Breakpoint sign (`g:delve_breakpoint_sign`)

Sets the sign to use to indicate breakpoints in the gutter.

Default: `let g:delve_breakpoint_sign = "●"`

### Breakpoint sign highlight color (`g:delve_breakpoint_sign_highlight`)

Set the color profile for the sign.

Default: `let g:delve_breakpoint_sign_highlight = "WarningMsg"`

### Tracepoint sign (`g:delve_tracepoint_sign`)

Sets the sign to use to indicate tracepoints in the gutter.

Default: `let g:delve_tracepoint_sign = "◆"`

### Tracepoint sign highlight color (`g:delve_tracepoint_sign_highlight`)

Set the color profile for the sign.

Default: `let g:delve_tracepoint_sign_highlight = "WarningMsg"`

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
