" A recursive version of https://vi.stackexchange.com/a/12305
function! highlight_inherit#getOpts(group)
  let output = execute('hi ' . a:group)
  let list = split(output, '\(\s\|\n\)\+')

  if list[2] == 'links'
    return highlight_inherit#getOpts(list[4])
  endif

  let dict = {}
  for item in list
    if match(item, '=') > 0
      let splited = split(item, '=')
      let dict[splited[0]] = splited[1]
    endif
  endfor
  return dict
endfunction

" Amalgamated from answers to https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim
function! highlight_inherit#SynGroups()
  let l:st = synstack(line('.'), col('.'))
  echom join(map(l:st, "synIDattr(v:val, 'name') . ' -> ' . synIDattr(synIDtrans(v:val), 'name')"), ', ')
endfun

function! highlight_inherit#write(new_name, options_dict, inherit)
  let l:hl_opt = []
  for [key, value] in items(extend(highlight_inherit#getOpts(a:inherit), a:options_dict, "force"))
    call insert(l:hl_opt, key . '=' . value)
  endfor
  execute('hi! ' . a:new_name . ' ' . join(l:hl_opt))
endfunction
