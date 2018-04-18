" #############################################################################
" # CREDITS & LICENSE #########################################################
" #############################################################################
" # Matt Troncali's VIM configuration for OS X, adapted from
" # - http://TODO
" #
" # Distributed under the MIT license.
" #############################################################################

" #############################################################################
" # Vundle Configuration                                                      #
" #############################################################################

set nocompatible    " Required.
filetype off        " Required.

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" List plugins to manage
Plugin 'gmarik/Vundle.vim'                  " Required.

" GENERAL PLUGINS ------------------------------------------------------------ {
    Plugin 'rking/ag.vim'                   " Search files internally.
    Plugin 'vim-airline/vim-airline'        " Status and tab bar.
    Plugin 'vim-airline/vim-airline-themes' " Themes for Airline.
    Plugin 'kien/ctrlp.vim'                 " Find files.
    Plugin 'tacahiroy/ctrlp-funky'          " Jump to function defs. w/in files.
    Plugin 'Lokaltog/vim-easymotion'        " Navigation within files.
    Plugin 'airblade/vim-gitgutter'         " Visual git changes.
    Plugin 'nathanaelkane/vim-indent-guides'     " Indent lines.
    Plugin 'kristijanhusak/vim-multiple-cursors' " Edit w/ multiple cursors.
    Plugin 'scrooloose/nerdtree'            " File tree navigator.
    Plugin 'jistr/vim-nerdtree-tabs'        " Better NERDTree integration.
    Plugin 'osyo-manga/vim-over'            " Preview command line replace.
    Plugin 'edkolev/promptline.vim'         " Generate shell promptline.
    Plugin 'vim-scripts/sessionman.vim'     " VIM session management.
    Plugin 'gcmt/wildfire.vim'              " Quick text selection.
    Plugin 'junegunn/fzf.vim'               " Fuzzy file finder.
    Plugin 'danro/rename.vim'               " Rename current file.
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
    Plugin 'editorconfig/editorconfig-vim'  " Project-level style preferences.
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

" #############################################################################
" # Plugin Configurations (Alphabetical Order)                                #
" #############################################################################

" AIRLINE {
    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme='angr'
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
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
    let g:indent_guides_auto_colors = 0
    let g:indent_guides_guide_size = 1
    let g:indent_guides_space_guides = 1
    let g:indent_guides_start_level = 2
" }

" #############################################################################
" # Misc. Configurations                                                      #
" #############################################################################

" COLOR SCHEME {
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

" Set end-line column at 81 and highlight extra text in red.
autocmd VimEnter,Colorscheme * :hi ColorColumn ctermbg=236
highlight OverLength ctermbg=1 ctermfg=9
match OverLength /\%81v.\+/
set colorcolumn=81

nmap :nt<cr> :NERDTree<cr>
