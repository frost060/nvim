"https://github.com/edkolev/tmuxline.vim
"https://www.sainnhe.dev/post/status-line-config/
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '%R',
      \'c'    : [ '#{sysstat_mem} #[fg=blue]#{sysstat_ntemp} #[fg=green]\ufa51#{upload_speed}' ],
      \'win'  : [ '#I', '#W' ],
      \'cwin' : [ '#I', '#W', '#F' ],
      \'x'    : [ "#[fg=green]#{download_speed} \uf6d9 #[fg=blue]#{sysstat_itemp} #{sysstat_cpu}" ],
      \'y'    : [ '%a' ],
      \'z'    : '#H #{prefix_highlight}'
      \}
let g:tmuxline_separators = {
      \ 'left' : "\ue0bc",
      \ 'left_alt': "\ue0bd",
      \ 'right' : "\ue0ba",
      \ 'right_alt' : "\ue0bd",
      \ 'space' : ' '}
