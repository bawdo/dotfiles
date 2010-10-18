"file" $HOME/.vimrc

syntax on
filetype on
:filetype indent plugin on

set autoindent
set nosi

" Turn smart indenting on for perl and ruby files
autocmd FileType perl set smartindent
autocmd FileType ruby set smartindent

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

au BufWinLeave * mkview " Save the fold view when we exit
au BufWinEnter * silent loadview " Load the fold view when we open
