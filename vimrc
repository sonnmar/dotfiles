" Grundsätzliches
scriptencoding utf-8
set nocompatible        " kein VI
set autochdir           " Wechsel des aktiven Pfads zur Datei
set modelines=0         " keine Modelines in Textfiles
set backspace=2         " Backspace bei indent,eol,start
set history=1000        " mehr Historie
set undolevels=1000     " mehr Rückgängig
let mapleader=","       " meine Tastenkombinationen mit ,


" Hilfsanzeigen
set title               " Titel für Fenster setzen
set wildmenu            " Kompletierung der Kommandozeile
set number              " Zeilennummern
" set relativenumber      " Zeilennummern relativ zur Zeile
set showmatch           " zusammengehörige Klammern anzeigen
set noshowmode          " keine Modusanzeige
syntax on               " Farbhervorhebung


" Statuszeile
" set laststatus=2
" set statusline=%F%m
" set statusline+=%r%h%w[%{&ff}]%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%y%=[%L][%p%%][%04l,%04v]


" Suchen
set hlsearch            " mit Beleuchtung
set smartcase           " keine Beachtung G/K wenn Pattern nur klein
set incsearch           " markieren beim Suchen
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" Ausschneiden und Einfügen
set clipboard+=unnamed  " Clipboard zwischen VIM und System teilen
set go+=a               " Visual selection automatically copied to clipboard


" wordwrap
set wrap                " phys. Zeilen in der Darstellung umbrechen
set linebreak           " Umbruch an Wortgrenzen


" Faltung
set foldmethod=manual   " Faltungen grundsätzlich manuell


" angehangene Leerzeichen
set listchars=trail:·   " angehangene Leerzeichen mit einem . anzeigen
set list                " Diese Zeichen anzeigen
nmap <Leader>tws :%s/\s\+$//e<CR>


" Tabsteurung
nmap ä :bn<CR>
nmap ö :bp<CR>
nmap ü :bd<CR>


" Tabs / Einrücken / Zeilenlänge
" set shiftround          " Einrückungen als vielfaches von shiftwidth
" set smartindent         " Smarter Einzug zur SW-Entwicklung
" set preserveindent      " Beim Ändern des Einzugs möglichst viel behalten
set smarttab            " Tabs am Anfang sind Einzüge
set expandtab           " Tabs werden zu Spaces
set autoindent          " Einzug mitführen
set tabstop=8           " gefundene Tabs sind 8 Spaces
set softtabstop=4       " eingegebene Tabs sind 4 Spaces
set shiftwidth=4        " automatisches Einrücken 4 Spaces
set textwidth=0         " kein harter Zeilenumbruch
set wrapmargin=0        " kein Umbruch bei der Texteingabe


" Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
au FileType markdown setlocal
    \ textwidth=79
    \ wrapmargin=2


" c-Type
au FileType c setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79


" Python
au FileType python setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79


" xml / html / css
au FileType xml,html,css setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=79


" junegunn/vim-plug
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


" Einbinden des Themes
set termguicolors
let g:onedark_terminal_italics = 1
colorscheme onedark


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_extensions = []
let g:airline_theme='minimalist'
