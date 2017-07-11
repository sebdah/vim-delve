vim-delve
=========

This is a Neovim and Vim plugin for debugging [Go](https://golang.org)
applications using [Delve](https://github.com/derekparker/delve). The project
works a lot nicer on Neovim with the built-in terminal, so that's what we
recommend. But it is decent to work with on Vim if you have
[Shougo/vimshell.vim](https://github.com/Shougo/vimshell.vim) installed.

*If you like this project, please star it. If you feel even more generous,
please follow [@sebdah](https://twitter.com/sebdah) on Twitter!*

Feature highlights
------------------

- Go syntax highlighting of debug output (only Neovim)
- Supports both breakpoints and tracepoints
- Run the Delve debugger in a split view along side your code
- Launches a Delve CLI, so all commands are supported in there
- Leverages the Neovim terminal (only on Neovim)
- Supports `main` as well as and non-`main` packages

![animated example](https://github.com/sebdah/vim-delve/raw/master/vim-delve-demo.gif "vim-delve demo")

Requirements
------------

- [Delve](https://github.com/derekparker/delve)

If you are on vim (not neovim), you'll also need the following two packages:

- [Shougo/vimshell.vim](https://github.com/Shougo/vimshell.vim)
- [Shougo/vimproc.vim](https://github.com/Shougo/vimproc.vim)

Installation
------------

Using `vim-plug`, add the following to your `init.vim` if you're on Neovim or
`.vimrc`, if you're on vim:

`Plug 'sebdah/vim-delve'`

Then reload neovim and run `PlugInstall`.

Commands
--------

| Command               | Comment
|-----------------------|-----------------------------------------------------------------------------------
| `DlvAddBreakpoint`    | Add a breakpoint at the current line.
| `DlvAddTracepoint`    | Add a tracepoint at the current line.
| `DlvAttach <pid>`     | Attach `dlv` to a running process.
| `DlvClearAll`         | Clear all the breakpoints and tracepoints in the buffer.
| `DlvDebug`            | Run `dlv debug` for the current session. Use this to test `main` packages.
| `DlvRemoveBreakpoint` | Remove the breakpoint at the current line.
| `DlvRemoveTracepoint` | Remove the tracepoint at the current line.
| `DlvTest`             | Run `dlv test` for the current session. Use this to debug non-`main` packages.
| `DlvToggleBreakpoint` | Convenience method to toggle (add or remove) a breakpoint at the current line.
| `DlvToggleTracepoint` | Convenience method to toggle (add or remove) a tracepoint at the current line.

Configuration
-------------

| Setting                              | Default value                                    | Comment
|--------------------------------------|--------------------------------------------------|-----------------------
| `g:delve_backend`                    | `default`                                        | Defines the backend to use with Delve. Please refer to the [Delve documentation](https://github.com/derekparker/delve/blob/master/Documentation/usage/dlv.md#options) for details on what you should set this value to.
| `g:delve_breakpoint_sign_highlight`  | `WarningMsg`                                     | Set the color profile for the sign.
| `g:delve_breakpoint_sign`            | `●`                                              | Sets the sign to use to indicate breakpoints in the gutter.
| `g:delve_cache_path`                 | `$HOME . "/.cache/" . v:progname . "/vim-delve"` | The path to where the instructions file for `dlv` is stored.
| `g:delve_enable_syntax_highlighting` | `1`                                              | Turn syntax highlighting in the `dlv` output on or off.
| `g:delve_new_command`                | `vnew`                                           | Control if `dlv` should be opened in a vertical (`vnew`), horizontal (`new`) or full screen window (`enew`).
| `g:delve_tracepoint_sign_highlight`  | `WarningMsg`                                     | Set the color profile for the sign.
| `g:delve_tracepoint_sign`            | `◆`                                              | Sets the sign to use to indicate tracepoints in the gutter.

The settings above can be set in your `init.vim` like this:

```
let g:delve_backend = "native"
```

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
