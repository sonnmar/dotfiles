" Grundsätzliches
scriptencoding utf-8
set nocompatible        " kein VI
set autochdir           " Wechsel des aktiven Pfads zur Datei
set modelines=0         " keine Modelines in Textfiles
set backspace=2         " Backspace bei indent,eol,start
let mapleader=" "       " meine Tastenkombinationen mit <Blank> starten


" Hilfsanzeigen
set title               " Titel für Fenster setzen
set wildmenu            " Kompletierung der Kommandozeile
set number              " Zeilennummern
" set relativenumber      " Zeilennummern relativ zur Zeile
set showmatch           " zusammengehörige Klammern anzeigen
set noshowmode          " keine Modusanzeige
syntax on               " Farbhervorhebung


" angehangene Leerzeichen anzeigen...
set listchars=trail:·   " durch ein '.'
set list                " Diese Zeichen anzeigen


" Suchen
set hlsearch            " mit Beleuchtung
set smartcase           " keine Beachtung G/K wenn Pattern nur klein
set incsearch           " markieren beim Suchen

" Suchmarkierung mit entfernen
nmap <Leader>ns :nohlsearch<Bar>:echo<CR> 


" Ausschneiden und Einfügen
set clipboard+=unnamedplus  " Clipboard zwischen VIM und System teilen
set go+=a                   " Visual selection automatically copied to clipboard


" wordwrap
set wrap                " phys. Zeilen in der Darstellung umbrechen
set wrapmargin=2        " Umbruchgrenze 2 Buchstaben vor Fenstergrenze
set linebreak           " Umbruch an Wortgrenzen


" Faltung
set foldmethod=manual   " Faltungen grundsätzlich manuell


" Tabsteurung
nmap ä :bn<CR>
nmap ö :bp<CR>
nmap ü :bd<CR>


" Tabs / Einrücken / Zeilenlänge
set shiftround          " Einrückungen als vielfaches von shiftwidth
set smartindent         " Smarter Einzug zur SW-Entwicklung
set preserveindent      " Beim Ändern des Einzugs möglichst viel behalten
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
au FileType markdown,tex setlocal
    \ textwidth=79
    \ formatoptions+=an


" xml / html / css
au FileType xml,html,css setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2
    \ textwidth=79


" Indent 4 Spaces
au FileType c,python,sh setlocal
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4


" Indent 2 Spaces
au FileType lua setlocal
    \ tabstop=2
    \ softtabstop=2
    \ shiftwidth=2


" Statuszeile
" set laststatus=2
" set statusline=%F%m
" set statusline+=%r%h%w[%{&ff}]%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%y%=[%L][%p%%][%04l,%04v]

" Einbindund Lua-Konfiguration
lua require('pluginmanager')

