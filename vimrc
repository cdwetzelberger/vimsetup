
if has("gui_running")
set background=light

else
set background=dark
endif
syntax enable

set nocompatible                                   " Use Vim defaults ( much better! )

set gfn=Courier:h12                                " use this font.

"set autochdir
set backspace=indent,eol,start                     " backspace work right

set iskeyword+=_,$,@,%,#                           " these don't act as word separators
set mouse=a                                        " enable mouse

set noerrorbells                                   " no sound! *BLING* *BLING* *BLING* SUCKS!

set wildmenu                                       " wild menu file listing                                     
set wildignore=*.exe,*.jpg,*.gif,*.png             " ignore these files in wild menu.

"set cursorcolumn
"set cursorline
set incsearch                                      " 
set laststatus=2                                   " show status bar always.
 
set hlsearch                                       " high light the search

"This sets the cursor line when in insert mode and removes it when out of
"insert mode.
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul


set lazyredraw                                     " don't redraw during macros. 

set number
set ruler
"set scrolloff=10

set showcmd                                        " shows the current command.
set showmatch                                      " cause cursor to show bracket matching

set ignorecase                                     " case insensitive
set infercase                                      " try to guess the case if caps lock is on..
set nowrap    

set smartcase

set guioptions-=T                                  "Get rid  of the tool bar in visual mac vim 
set vb t_vb=                                       "Keeps vim from beeping when a command doesn't work, just flashes

set expandtab                                      " no real tabs.
set shiftwidth=2
set softtabstop=2
set tabstop=2                                      "Make tabs into spaces x spaces 

" Indent to nearest tabstop
set shiftround

set hidden                                         "Lets you switch buffers without saving.
  
" Indentions
set autoindent
set smartindent
filetype plugin indent on

set clipboard=unnamed

" Make command mode a bit more responsive to typical 
" editing/formating keys, like space backspace and Enter
:map <Space> i <Esc>l
:map <Backspace> "_dh
:map <PageDown> <C-d>
:map <PageUp> <C-b>
:map <CR> i <CR><Esc>

"disable help typing help is not such a burden.
:map <F1> <Esc>
:imap <F1> <Esc>
:imap jj <Esc> 

" These are great but they are causing me problems on other peoples system
" time to break the habit
" :imap jj <Esc><Right>
" :imap kk <Esc><Right>


"Vimdiff Ignore white spaces
"set diffopt+=iwhite

"Lets you pass a visual block to perl titdy by pushgin "="
autocmd Filetype perl :set equalprg=perltidy


" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" Make tab in v mode work like I think it should (keep highlighting):
" vmap <tab> >gv
" vmap <s-tab> <gv


" Undo in insert mode.
imap <c-z> <c-o>u

" Turn on and off NERDTree via F2
 "map <F2> :NERDTreeToggle<CR>

"autocmd BufNewFile,BufRead *.java imap . .<c-x><c-o>


"autocmd BufNewFile,BufRead *.java imap <c-Space> blah<c-x><c-u>
imap <c-Space> blah<c-x><c-u>


"Lets you do cross platform .vimrc settings
 if has('mac')
"Back up files to ~/.vim/backup
set backup
set backupdir=~/.vim/backup

   " Author:  Benji Fisher <benji@member.AMS.org>
   " Last modified:  8 May 2006
   " TODO:  Is there a better way to tell that Vim.app was started from Finder.app?
   " Note:  Do not move this to the gvimrc file, else this value of $PATH will
   " not be available to plugin scripts.
   if has("gui_running") && system('ps xw | grep "Vim -psn" | grep -vc grep') > 0
     " Get the value of $PATH from a login shell.
     " If your shell is not on this list, it may be just because we have not
     " tested it.  Try adding it to the list and see if it works.  If so,
     " please post a note to the vim-mac list!
     if $SHELL =~ '/\(sh\|csh\|bash\|tcsh\|zsh\)$'
       let s:path = system("echo echo VIMPATH'${PATH}' | $SHELL -l")
       let $PATH = matchstr(s:path, 'VIMPATH\zs.\{-}\ze\n')
     endif
   endif
 elseif has('win32')
"Back up files to ~/.vim/backup
set backup
silent execute '!mkdir "'.$HOME.'/backup"'
set backupdir=$HOME/backup
 elseif has ('unix')
"Back up files to ~/.vim/backup
set backup
set backupdir=~/.vim/backup
 endif

"exuberant ctag support
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
set tags=tags;/


"Enable Perl support
filetype plugin on



set spell
set spellcapcheck='' " basically says do not suggest capitalization after punctuation.  I want this because In code files if ! variable then ... gets marked otherwise. 

"hi clear SpellBad
"hi SpellBad cterm=underline
