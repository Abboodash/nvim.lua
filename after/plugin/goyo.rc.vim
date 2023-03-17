function! s:goyo_enter()
    lua require("lualine").hide({unhide = false})
    lua vim.cmd('Barbecue hide')
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  endif
endfunction

function! s:goyo_leave()
    lua require("lualine").hide({unhide = true})
    lua vim.cmd('Barbecue show')
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
