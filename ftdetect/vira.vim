" File: ftdetect/vira.vim {{{1
" Description: Vira filetypes detection
" Authors:
"   n0v1c3 (Travis Gall) <https://github.com/n0v1c3>

augroup Vira
  autocmd!
  autocmd BufNewFile,BufRead vira_menu setf vira_menu
  autocmd BufNewFile,BufRead vira_report setf vira_report

  " Menu
  autocmd BufEnter vira_menu call vira#_filter_load()
  autocmd Filetype vira_menu nnoremap <silent> <buffer> <cr> 0:call vira#_set()<cr>:q!<cr>:call vira#_refresh()<cr>
  autocmd Filetype vira_menu nnoremap <silent> <buffer> S :call vira#_all('select')<cr>
  autocmd Filetype vira_menu nnoremap <silent> <buffer> U :call vira#_all('unselect')<cr>
  autocmd Filetype vira_menu nnoremap <silent> <buffer> s :call vira#_select()<cr>
  autocmd Filetype vira_menu nnoremap <silent> <buffer> u :call vira#_unselect()<cr>
  autocmd Filetype vira_menu setlocal norelativenumber
  autocmd Filetype vira_menu setlocal number
  autocmd Filetype vira_menu setlocal winfixheight

  " Report
  " autocmd BufEnter vira_report setlocal winfixwidth
  autocmd Filetype vira_report nnoremap <silent> <buffer> <cr> :call vira#_edit_report()<cr>
  autocmd Filetype vira_report setlocal nonumber
  autocmd Filetype vira_report setlocal norelativenumber

  " Common
  autocmd Filetype vira_menu,vira_report cnoremap <silent> <buffer> q!<cr> :q!<cr>:call vira#_resize()<cr>
  autocmd Filetype vira_menu,vira_report cnoremap <silent> <buffer> q<cr> :q!<cr>:call vira#_resize()<cr>
  autocmd Filetype vira_menu,vira_report nnoremap <silent> <buffer> q :q!<cr>:call vira#_resize()<cr>
  autocmd Filetype vira_menu,vira_report vnoremap <silent> <buffer> j gj
  autocmd Filetype vira_menu,vira_report vnoremap <silent> <buffer> k gk
  autocmd BufLeave vira_menu,vira_report call vira#_filter_unload()
augroup END
