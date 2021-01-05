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

" restore Vi compatibility settings
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: sw=2 ts=2 et
