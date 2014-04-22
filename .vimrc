" Begin .vimrc

execute pathogen#infect()
syntax enable
set t_Co=256

"set nocompatible
set bs=2
set columns=80
set background=dark
set wrapmargin=8
set ruler
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon175
set guicursor+=i:blinkwait175

if $TERM =~ "-256color"
  set background=light 
endif

set viminfo='25,\"50,n~/.viminfo

if has("autocmd")
    autocmd BufReadPost *
    \ if line("\'") > 0 && line("\'") <= line("$") |
        \ exe "normal g`" |
    \ endif
endif

"enter new line senza insert mode"
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"correzione ortografica
set spelllang=it
	"set spellfile=/home/orco/.vim/spell/it.utf-8.spl

" Use ranger as vim file manager
function! Ranger()
   " Get a temp file name without creating it
   let tmpfile = substitute(system('mktemp -u'), '\n', '', '')
   " Launch ranger, passing it the temp file name
   silent exec '!RANGER_RETURN_FILE='.tmpfile.' ranger'
	" If the temp file has been written by ranger
if filereadable(tmpfile)
	" Get the selected file name from the temp file
	let filetoedit = system('cat '.tmpfile)
	exec 'edit '.filetoedit
call delete(tmpfile)
	endif
    redraw!
endif
endfunction
filetype plugin indent on 
set nocp

"capitalize shortcut
au FileType c,cpp setlocal comments-=:// comments+=f://
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif
