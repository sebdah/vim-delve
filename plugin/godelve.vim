" vim-delve - Delve debugger integration

if !has("nvim")
    echomsg "vim-delve requires neovim"
endif

"-------------------------------------------------------------------------------
"                           Configuration options
"-------------------------------------------------------------------------------

" godelve_instructions holds all the instructions to delve in an array.
if !exists("g:godelve_instructions")
  let g:godelve_instructions = []
endif

" godelve_cache_path sets the default vim-delve cache path for breakpoint files.
if !exists("g:godelve_cache_path")
  let g:godelve_cache_path = "~/.cache/vim-delve"
endif

"-------------------------------------------------------------------------------
"                              Implementation
"-------------------------------------------------------------------------------

" Ensure that the cache path exists.
call mkdir(g:godelve_cache_path, "p")

" Build the breakpoints file with some degree of uniqueness.
let godelve_instructions_file = g:godelve_cache_path . "/". getpid() . "." . localtime()

" Remove the instructions file
autocmd VimLeave * call godelve#removeInstructionsFile()<cr>

" Configure the breakpoint sign in the gutter.
exe "sign define godelve_breakpoint text=◉ texthl=WarningMsg"

" removeInstructionsFile is removing the defined instructions file. Typically
" called when neovim is exited.
function! godelve#removeInstructionsFile(...) abort
    call delete(godelve_instructions_file)
endfunction

" toggleBreakpoint is toggling breakpoints at the line under the cursor.
function! godelve#toggleBreakpoint(file, line, ...) abort
    let breakpoint = "break " . a:file . ':' . a:line

    " Find the breakpoint in the instructions, if available. If it's already
    " there, remove it. If not, add it.
    let i = index(g:godelve_instructions, breakpoint)

    if i == -1
      call add(g:godelve_instructions, breakpoint)
      exe "sign place ". a:line ." line=" . a:line . " name=godelve_breakpoint file=" . a:file
    else
      call remove(g:godelve_instructions, i)
      exe "sign unplace ". a:line ." file=" . a:file
    endif
endfunction

"-------------------------------------------------------------------------------
"                                 Commands
"-------------------------------------------------------------------------------
command! -nargs=* -bang GoToggleBreakpoint call godelve#toggleBreakpoint(expand('%:p'), line('.'), <f-args>)
