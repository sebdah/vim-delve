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
- Supports [vimux](https://github.com/benmills/vimux) optionally

![animated example](https://github.com/sebdah/vim-delve/raw/master/vim-delve-demo.gif "vim-delve demo")

Requirements
------------

For Neovim and Vim 8, you really only need Delve to get started.

- [Delve](https://github.com/derekparker/delve)

If you wish to use the vimux support, you'd need to have this plugin as well:

- [benmills/vimux](https://github.com/benmills/vimux)

### Requirements for Vim 7 and earlier

If you are on Vim versions older than 8, you'll also need the following two packages:

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

| Command                        | Comment
|--------------------------------|-----------------------------------------------------------------------------------
| `DlvAddBreakpoint`             | Add a breakpoint at the current line.
| `DlvAddTracepoint`             | Add a tracepoint at the current line.
| `DlvAttach <pid> [flags]`      | Attach `dlv` to a running process.
| `DlvClearAll`                  | Clear all the breakpoints and tracepoints in the buffer.
| `DlvCore <bin> <dump> [flags]` | Debug core dumps using `dlv core`.
| `DlvConnect host:port [flags]` | Connect to a remote Delve server on the given host:port.
| `DlvDebug [flags]`             | Run `dlv debug` for the current session. Use this to test `main` packages.
| `DlvExec <bin> [flags]`        | Start `dlv` on a pre-built executable.
| `DlvRemoveBreakpoint`          | Remove the breakpoint at the current line.
| `DlvRemoveTracepoint`          | Remove the tracepoint at the current line.
| `DlvTest [flags]`              | Run `dlv test` for the current session. Use this to debug non-`main` packages.
| `DlvToggleBreakpoint`          | Convenience method to toggle (add or remove) a breakpoint at the current line.
| `DlvToggleTracepoint`          | Convenience method to toggle (add or remove) a tracepoint at the current line.
| `DlvVersion`                   | Print the `dlv` version.

Configuration
-------------

| Setting                              | Default value                                         | Comment
|--------------------------------------|-------------------------------------------------------|-----------------------
| `g:delve_backend`                    | `default`                                             | Defines the backend to use with Delve. Please refer to the [Delve documentation](https://github.com/derekparker/delve/blob/master/Documentation/usage/dlv.md#options) for details on what you should set this value to.
| `g:delve_sign_group`                 | `delve`                                               | Set the sign group.
| `g:delve_sign_priority`              | 10                                                    | Set the sign priority.
| `g:delve_breakpoint_sign_highlight`  | `WarningMsg`                                          | Set the color profile for the sign.
| `g:delve_breakpoint_sign`            | `●`                                                   | Sets the sign to use to indicate breakpoints in the gutter.
| `g:delve_tracepoint_sign_highlight`  | `WarningMsg`                                          | Set the color profile for the sign.
| `g:delve_tracepoint_sign`            | `◆`                                                   | Sets the sign to use to indicate tracepoints in the gutter.
| `g:delve_cache_path`                 | `$HOME . "/.cache/" . v:progname . "/vim-delve"`      | The path to where the instructions file for `dlv` is stored.
| `g:delve_instructions_file`          | `g:delve_cache_path ."/". getpid() .".". localtime()` | The instructions file name.
| `g:delve_enable_syntax_highlighting` | `1`                                                   | Turn syntax highlighting in the `dlv` output on or off.
| `g:delve_new_command`                | `vnew`                                                | Control if `dlv` should be opened in a vertical (`vnew`), horizontal (`new`) or full screen window (`enew`).
| `g:delve_use_vimux      `            | `0`                                                   | Sets whether to use [benmills/vimux](https://github.com/benmills/vimux)].
| `g:delve_project_root`               |                                                       | Override the path to use for setting breakpoints/tracepoints.

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

Contributing to vim-delve
-------------------------

Contributions to the project is most welcome. I'd be happy to review and merge
pull requests. If you need any directions in your implementation we can always
discuss that too.

### What can I do to help?

There are many things that this project need, but some examples could be:

- I don't know if this works on Windows. If you could try it out and or make it
    work that would be great.
- I haven't tested the project thoroughly on Vim, if you could do that it'd be
    wonderful.
- Answer [questions from users](https://github.com/sebdah/vim-delve/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22)
- Or implement [new features](https://github.com/sebdah/vim-delve/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement)

License
-------

MIT Licensed software.
