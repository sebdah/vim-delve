" vim-delve - Delve debugger integration

if !has("nvim")
    echomsg "vim-delve requires neovim"
endif

"-------------------------------------------------------------------------------
"                           Configuration options
"-------------------------------------------------------------------------------

" delve_cache_path sets the default vim-delve cache path for breakpoint files.
if !exists("g:delve_cache_path")
    let g:delve_cache_path = $HOME . "/.cache/" . v:progname . "/vim-delve"
endif

" delve_backend is setting the backend to use for the dlv commands.
if !exists("g:delve_backend")
    let g:delve_backend = "default"
endif

" Build the breakpoints file with some degree of uniqueness.
let g:delve_instructions_file = g:delve_cache_path . "/". getpid() . "." . localtime()

"-------------------------------------------------------------------------------
"                              Implementation
"-------------------------------------------------------------------------------
" delve_instructions holds all the instructions to delve in a list.
let g:delve_instructions = []

" Ensure that the cache path exists.
call mkdir(g:delve_cache_path, "p")

" Remove the instructions file
autocmd VimLeave * call delve#removeInstructionsFile()<cr>

" Configure the breakpoint sign in the gutter.
exe "sign define delve_breakpoint text=◉ texthl=WarningMsg"

" clearBreakpoints is removing all active breakpoints.
function! delve#clearBreakpoints(...)
    call delve#removeInstructionsFile()
    for i in range(len(g:delve_instructions))
        let g:delve_instructions = []
        exe "sign unplace ". eval(i+1)
    endfor
endfunction

" dlvDebug is calling 'dlv debug' for the currently active main package.
function! delve#dlvDebug(dir, ...)
    call delve#dlvCommandRunner(a:dir, "debug", "")
endfunction

" dlvTest is calling 'dlv test' for the currently active package.
function! delve#dlvTest(dir, ...)
    call delve#dlvCommandRunner(a:dir, "test", "")
endfunction

" dlvCommandRunner is a generic function that calls the dlv binary with various
" flags.
function! delve#dlvCommandRunner(dir, command, flags, ...)
    call delve#writeInstructionsFile()

    vnew
    set syntax=go
    call termopen("cd " . a:dir . " ; dlv " . a:command . " --backend=" . g:delve_backend . " --init=" . g:delve_instructions_file . " " . a:flags)
    startinsert
endfunction

" toggleBreakpoint is toggling breakpoints at the line under the cursor.
function! delve#toggleBreakpoint(file, line, ...)
    let breakpoint = "break " . a:file . ':' . a:line

    " Find the breakpoint in the instructions, if available. If it's already
    " there, remove it. If not, add it.
    let i = index(g:delve_instructions, breakpoint)

    if i == -1
        call add(g:delve_instructions, breakpoint)
        exe "sign place ". len(g:delve_instructions) ." line=" . a:line . " name=delve_breakpoint file=" . a:file
    else
        call remove(g:delve_instructions, i)
        exe "sign unplace ". eval(i+1) ." file=" . a:file
    endif
endfunction

" removeInstructionsFile is removing the defined instructions file. Typically
" called when neovim is exited.
function! delve#removeInstructionsFile(...)
    call delete(g:delve_instructions_file)
endfunction

" writeInstructionsFile is persisting the instructions to the set file.
function! delve#writeInstructionsFile(...) abort
    call writefile(g:delve_instructions + ["continue"], g:delve_instructions_file)
endfunction

"-------------------------------------------------------------------------------
"                                 Commands
"-------------------------------------------------------------------------------
command! -nargs=* -bang DlvToggleBreakpoint call delve#toggleBreakpoint(expand('%:p'), line('.'), <f-args>)
command! -nargs=* -bang DlvClearBreakpoints call delve#clearBreakpoints(<f-args>)
command! -nargs=* -bang DlvDebug call delve#dlvDebug(expand('%:p:h'), <f-args>)
command! -nargs=* -bang DlvTest call delve#dlvTest(expand('%:p:h'), <f-args>)
