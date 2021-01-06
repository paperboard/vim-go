" don't spam the user when Vim is started in Vi compatibility mode
let s:cpo_save = &cpo
set cpo&vim

function! go#auto#template_autocreate()
  if !go#config#TemplateAutocreate() || !&modifiable
    return
  endif

  " create new template from scratch
  call go#template#create()
endfunction

function! go#auto#modfmt_autosave()
  if !(go#config#ModFmtAutosave() && isdirectory(expand('%:p:h')) && expand('<afile>:p') == expand('%:p'))
    return
  endif

  " go.mod code formatting on save
  call go#mod#Format()
endfunction

function! go#auto#asmfmt_autosave()
  if !(go#config#AsmfmtAutosave() && isdirectory(expand('%:p:h')) && expand('<afile>:p') == expand('%:p'))
    return
  endif

  " Go asm formatting on save
  call go#asmfmt#Format()
endfunction

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
