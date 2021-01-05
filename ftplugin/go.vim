" Copyright 2013 The Go Authors. All rights reserved.
" Use of this source code is governed by a BSD-style
" license that can be found in the LICENSE file.
"
" go.vim: Vim filetype plugin for Go.

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl fo< com< cms<"
      \ . "| exe 'au! vim-go-buffer * <buffer>'"

setlocal formatoptions-=t

setlocal comments=s1:/*,mb:*,ex:*/,://
setlocal commentstring=//\ %s

setlocal noexpandtab

compiler go

if get(g:, "go_def_mapping_enabled", 1)
  " these are default Vim mappings, we're overriding them to make them
  " useful again for Go source code
  nnoremap <buffer> <silent> gd :GoDef<cr>
  nnoremap <buffer> <silent> <C-]> :GoDef<cr>
  nnoremap <buffer> <silent> <C-LeftMouse> <LeftMouse>:GoDef<cr>
  nnoremap <buffer> <silent> g<LeftMouse> <LeftMouse>:GoDef<cr>
  nnoremap <buffer> <silent> <C-w><C-]> :<C-u>call go#def#Jump("split", 0)<CR>
  nnoremap <buffer> <silent> <C-w>] :<C-u>call go#def#Jump("split", 0)<CR>
  nnoremap <buffer> <silent> <C-t> :<C-U>call go#def#StackPop(v:count1)<cr>
endif

if get(g:, "go_textobj_enabled", 1)
  onoremap <buffer> <silent> af :<c-u>call go#textobj#Function('a')<cr>
  xnoremap <buffer> <silent> af :<c-u>call go#textobj#Function('a')<cr>

  onoremap <buffer> <silent> if :<c-u>call go#textobj#Function('i')<cr>
  xnoremap <buffer> <silent> if :<c-u>call go#textobj#Function('i')<cr>

  onoremap <buffer> <silent> ac :<c-u>call go#textobj#Comment('a')<cr>
  xnoremap <buffer> <silent> ac :<c-u>call go#textobj#Comment('a')<cr>

  onoremap <buffer> <silent> ic :<c-u>call go#textobj#Comment('i')<cr>
  xnoremap <buffer> <silent> ic :<c-u>call go#textobj#Comment('i')<cr>
endif

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
