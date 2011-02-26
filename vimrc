"file" $HOME/.vimrc

syntax on
filetype on
:filetype indent plugin on

" Turn syntax highlighting off for large files
let g:LargeFile = 15

set autoindent
set nosi

" Turn smart indenting on for perl and ruby files
autocmd FileType perl set smartindent
autocmd FileType perl set nowrap
autocmd FileType perl set ts=4
autocmd FileType perl set shiftwidth=4
autocmd FileType perl set shiftround
autocmd FileType perl set expandtab

autocmd FileType ruby set smartindent
autocmd FileType ruby set nowrap
autocmd FileType ruby set ts=2
autocmd FileType ruby set shiftwidth=2 
autocmd FileType ruby set shiftround
autocmd FileType ruby set expandtab

set textwidth=78

set showmatch 		" Show matching brackets
set matchtime=5 	" Match fo 5 tenths of a second

set ignorecase
set smartcase

set copyindent " Copy indenting conventions from elsewhere in the file?
set preserveindent " Same as above?

set nowrap " Turn line wrapping off

set background=dark

set nostartofline " leave my cursor where it was on file reopen

set ruler
set showmode
set showcmd
set modeline

" Create a backup of each file I edit.
set backup
" mkdir -pv ~/.vim/{backups,tmp}
set backupdir=~/.vim/backups 
set directory=~/.vim/tmp

" Turnon tab completion for filenames, helptops, options et cetera
set wildmode=list:longest,full
set wildmenu

" Correct common spelling mistakes
abbreviate teh the

" Key mappings
" F7 to spell check
:map <F7> :setlocal spell! spelllang=en_au<cr> 
:imap <F7> <C-o>:setlocal spell! spelllang=en_au<cr>

set foldenable " Turn on folding
set foldcolumn=4 " One column for fold markers
set foldmethod=marker " Fold on the marker
au BufWinLeave * mkview " Save the fold view when we exit
au BufWinEnter * silent loadview " Load the fold view when we open

" Rails Maps & Abbreviations
map <C-G> c_("<C-R>"")<ESC>
map <C-B> c<%= _("<C-R>"") %><ESC>
:abbr rs <%
:abbr rq <%=
:abbr re %>

"Turn on spell checking for mail if vim ver > 7.0
if (v:version >= 700)
    au FileType mail set spell
endif

"When editing a file, make screen display the name of the fil
function! SetTitle()
  if $TERM =~ "^screen"
    let l:title = 'vi: ' . expand('%:t')

    if (l:title != 'vi: __Tag_List__')
      let l:truncTitle = strpart(l:title, 0, 15)
      silent exe '!echo -e -n "\033k' . l:truncTitle . '\033\
    endif
  endif
endfunction

" Run it every time we change buffers
autocmd BufEnter,BufFilePost * call SetTitle()
