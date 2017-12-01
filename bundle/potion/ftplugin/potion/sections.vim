"previous section begin
noremap <script> <buffer> <silent> [[  :call <SID>GoSection(0,0,0)<CR>
"previous section end
noremap <script> <buffer> <silent> []  :call <SID>GoSection(0,1,0)<CR>
"next section begin
noremap <script> <buffer> <silent> ]]  :call <SID>GoSection(1,0,0)<CR>
"next section end
noremap <script> <buffer> <silent> ][  :call <SID>GoSection(1,1,0)<CR>

"previous section begin
vnoremap <script> <buffer> <silent> [[  :call <SID>GoSection(0,0,1)<CR>
"previous section end
vnoremap <script> <buffer> <silent> []  :call <SID>GoSection(0,1,1)<CR>
"next section begin
vnoremap <script> <buffer> <silent> ]]  :call <SID>GoSection(1,0,1)<CR>
"next section end
vnoremap <script> <buffer> <silent> ][  :call <SID>GoSection(1,1,1)<CR>


function! s:GoSection(PrevOrNext, BeginOrEnd, VisualOrNormal)
    if a:VisualOrNormal == 1
        normal! gv
    endif
    if a:PrevOrNext == 1
        let goPreOrNext = "/"
    else
        let goPreOrNext = "?"
    endif

    if a:BeginOrEnd == 0
        let findBeginOrEnd = goPreOrNext . '\v(\n\n\S|%^)' . goPreOrNext . "e"
    else
        let findBeginOrEnd = goPreOrNext . '\v(\n\n\S)'
    endif

    execute "silent normal! " . findBeginOrEnd . "\r"
endfunction
