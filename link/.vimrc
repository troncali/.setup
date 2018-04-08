" Matt Troncali's VIM configuration for OS X.

" ###############################################################
" ## VUNDLE CONFIG ##############################################
" ###############################################################

set nocompatible    " Required.
filetype off        " Required.

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" List plugins to manage
Plugin 'gmarik/Vundle.vim'                  " Required.

" GENERAL PLUGINS ------------------------------------------------------------ {
    Plugin 'rking/ag.vim'                   " Search files internally.
    Plugin 'bling/vim-airline'              " Status and tab bar.
    Plugin 'kien/ctrlp.vim'                 " Find files.
    Plugin 'tacahiroy/ctrlp-funky'          " Jump to function defs. w/in files.
    Plugin 'Lokaltog/vim-easymotion'        " Navigation within files.
    Plugin 'airblade/vim-gitgutter'         " Visual git changes.
    Plugin 'nathanaelkane/vim-indent-guides'     " Indent lines.
    Plugin 'kristijanhusak/vim-multiple-cursors' " Edit w/ multiple cursors.
    Plugin 'scrooloose/nerdtree'            " File tree navigator.
    Plugin 'jistr/vim-nerdtree-tabs'        " Better NERDTree integration.
    Plugin 'osyo-manga/vim-over'            " Preview command line replace.
"   Plugin 'edkolev/promptline.vim'         " Generate shell promptline (**TODO**).
    Plugin 'vim-scripts/sessionman.vim'     " VIM session management.
    Plugin 'gcmt/wildfire.vim'              " Quick text selection.
" }

" CODING PLUGINS ------------------------------------------------------------- {
    Plugin 'Raimondi/delimitMate'           " Autoclose (, [, {, quotes.
    Plugin 'tpope/vim-fugitive'             " Git wrapper for VIM.
    Plugin 'scrooloose/nerdcommenter'       " Quick commenting.
    Plugin 'tpope/vim-repeat'               " . command for plugins.
    Plugin 'honza/vim-snippets'             " Code snippets.
    Plugin 'tpope/vim-surround'             " Edit surrounding (), [], <>, etc.
    Plugin 'scrooloose/syntastic'           " Global syntax checker.
    Plugin 'godlygeek/tabular'              " Align code with tabs.
    Plugin 'majutsushi/tagbar'              " Browse ctags in current file.
    Plugin 'SirVer/ultisnips'               " Code snippet enigine.
    Plugin 'Valloric/YouCompleteMe'         " Code autocompletion engine.
" }

" JAVASCRIPT PLUGINS --------------------------------------------------------- {
    Plugin 'pangloss/vim-javascript'        " Syntax.
    Plugin 'jelera/vim-javascript-syntax'   " Syntax.
    Plugin 'elzr/vim-json'                  " JSON syntax and warnings.
    Plugin 'marijnh/tern_for_vim'           " Code analysis engine.
" }

" PYTHON PLUGINS ------------------------------------------------------------- {
"   Plugin 'klen/python-mode'
" }

" HTML PLUGINS --------------------------------------------------------------- {
" }

" Add all Plugins before next line
call vundle#end()            " required
filetype plugin indent on    " required

" see :h vundle for more details or wiki for FAQ


" ###############################################################
" ## PLUGIN CONFIGURATIONS (Alphabetical Order) #################
" ###############################################################

" AIRLINE {
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
" }

" CTRL P {
    "
" }

" CTRL P-FUNKY {
    "
" }

" DELIMITMATE {
    "
" }

" EASY MOTION {
    "
" }

" FUGITIVE {
    "
" }

" GIT GUTTER {
    "
" }

" INDENT GUIDES {
    autocmd VimEnter * IndentGuidesEnable
    let g:indent_guides_guide_size = 1
    let g:indent_guides_space_guides = 1
    let g:indent_guides_start_level = 2
" }

" #############################################################
" ## MISC. CONFIGURATIONS #####################################
" #############################################################

" COLOR SCHEME {        TODO: FIX SYNTAX COLORS FOR .JS
    let g:smyck_termcolors = 16
    colorscheme smyck
" }

" TABS {
    :set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
    :set list listchars=tab:··,trail:·,extends:»,precedes:«
" }


if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=2
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set modelines=0
set window=0
" vim: set ft=vim :

:syntax enable
:set nu
set colorcolumn=81

nmap :nt<cr> :NERDTree<cr>
