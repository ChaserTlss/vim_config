setlocal foldmethod=expr
setlocal foldignore=
setlocal foldexpr=MyFoldLevel(v:lnum)

function! IsNullLine(lnum)
    if getline(a:lnum) =~# '\v^\s*$'
        return 1
    else
        return 0
    endif
endfunction

function! NumPointInOneLine(lnum)
    let postion = -1
    let myNum = 0
    while 1
        let postion = stridx(getline(a:lnum), ".", postion + 1)
        if postion == -1
            break
        endif
        let myNum += 1
    endwhile
    return myNum
endfunction

function! ComputeFoldLeve(lnum)
   if getline(a:lnum) =~# '\v.*:.*' && getline(a:lnum) =~# '\v.*\..*'
       return "="
   elseif getline(a:lnum) =~# '\v.*:.*'
       return "a1"
   elseif getline(a:lnum) =~# '\v.*\..*'
       return "s" . NumPointInOneLine(a:lnum)
   else
       return "="
   endif
endfunction

function! MyFoldLevel(lnum)
    "if this line is line a comment stack of next stack 
        "then it's foldlevel same as parent stack
    if getline(a:lnum) =~# '\v\s*#'
        return "="
    endif
    "compute the fold leve with follow : and .
    return ComputeFoldLeve(a:lnum)
endfunction
