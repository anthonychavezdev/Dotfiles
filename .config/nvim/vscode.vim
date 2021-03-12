" TODO there is a more contemporary version of this file
" TODO Also some of it is redundant
" VSCode
" Scrolling commands
"==============================
function s:reveal(direction, resetCursor)
    call VSCodeExtensionNotify('reveal', a:direction, a:resetCursor)
endfunction

nnoremap z<CR> <Cmd>call <SID>reveal('top', 1)<CR>
xnoremap z<CR> <Cmd>call <SID>reveal('top', 1)<CR>
nnoremap zt <Cmd>call <SID>reveal('top', 0)<CR>
xnoremap zt <Cmd>call <SID>reveal('top', 0)<CR>
nnoremap z. <Cmd>call <SID>reveal('center', 1)<CR>
xnoremap z. <Cmd>call <SID>reveal('center', 1)<CR>
nnoremap zz <Cmd>call <SID>reveal('center', 0)<CR>
xnoremap zz <Cmd>call <SID>reveal('center', 0)<CR>
nnoremap z- <Cmd>call <SID>reveal('bottom', 1)<CR>
xnoremap z- <Cmd>call <SID>reveal('bottom', 1)<CR>
nnoremap zb <Cmd>call <SID>reveal('bottom', 0)<CR>
xnoremap zb <Cmd>call <SID>reveal('bottom', 0)<CR>


function s:moveCursor(to)
    " Native VSCode commands don't register jumplist. Fix by registering jumplist in Vim e.g. for subsequent use of <C-o>
    normal! m'
    call VSCodeExtensionNotify('move-cursor', a:to)
endfunction

nnoremap H <Cmd>call <SID>moveCursor('top')<CR>
xnoremap H <Cmd>call <SID>moveCursor('top')<CR>
nnoremap M <Cmd>call <SID>moveCursor('middle')<CR>
xnoremap M <Cmd>call <SID>moveCursor('middle')<CR>
nnoremap L <Cmd>call <SID>moveCursor('bottom')<CR>
xnoremap L <Cmd>call <SID>moveCursor('bottom')<CR>

" Disabled due to scroll problems (the ext binds them directly)
" nnoremap <silent> <expr> <C-d> VSCodeExtensionCall('scroll', 'halfPage', 'down')
" xnoremap <silent> <expr> <C-d> VSCodeExtensionCall('scroll', 'halfPage', 'down')
" nnoremap <silent> <expr> <C-u> VSCodeExtensionCall('scroll', 'halfPage', 'up')
" xnoremap <silent> <expr> <C-u> VSCodeExtensionCall('scroll', 'halfPage', 'up')

" nnoremap <silent> <expr> <C-f> VSCodeExtensionCall('scroll', 'page', 'down')
" xnoremap <silent> <expr> <C-f> VSCodeExtensionCall('scroll', 'page', 'down')
" nnoremap <silent> <expr> <C-b> VSCodeExtensionCall('scroll', 'page', 'up')
" xnoremap <silent> <expr> <C-b> VSCodeExtensionCall('scroll', 'page', 'up')

" nnoremap <silent> <expr> <C-e> VSCodeExtensionNotify('scroll-line', 'down')
" xnoremap <silent> <expr> <C-e> VSCodeExtensionNotify('scroll-line', 'down')
" nnoremap <silent> <expr> <C-y> VSCodeExtensionNotify('scroll-line', 'up')
" xnoremap <silent> <expr> <C-y> VSCodeExtensionNotify('scroll-line', 'up')
"==============================
" File commands
"==============================
function! s:editOrNew(...)
    let file = a:1
    let bang = a:2

    if empty(file)
        if bang ==# '!'
            call VSCodeNotify('workbench.action.files.openFile')
        else
            call VSCodeNotify('workbench.action.quickOpen')
        endif
    else
        " Last arg is to close previous file, e.g. e! ~/blah.txt will open blah.txt instead the current file
        call VSCodeExtensionNotify('open-file', expand(file), bang ==# '!' ? 1 : 0)
    endif
endfunction

function! s:saveAndClose() abort
    call VSCodeCall('workbench.action.files.save')
    call VSCodeNotify('workbench.action.closeActiveEditor')
endfunction

function! s:saveAllAndClose() abort
    call VSCodeCall('workbench.action.files.saveAll')
    call VSCodeNotify('workbench.action.closeAllEditors')
endfunction

" command! -bang -nargs=? Edit call VSCodeCall('workbench.action.quickOpen')
command! -complete=file -bang -nargs=? Edit call <SID>editOrNew(<q-args>, <q-bang>)
command! -bang -nargs=? Ex call <SID>editOrNew(<q-args>, <q-bang>)
command! -bang Enew call <SID>editOrNew('__vscode_new__', <q-bang>)
command! -bang Find call VSCodeNotify('workbench.action.quickOpen')

command! -complete=file -bang Write if <q-bang> ==# '!' | call VSCodeNotify('workbench.action.files.saveAs') | else | call VSCodeNotify('workbench.action.files.save') | endif
command! -bang Saveas call VSCodeNotify('workbench.action.files.saveAs')

command! -bang Wall call VSCodeNotify('workbench.action.files.saveAll')
command! -bang Quit if <q-bang> ==# '!' | call VSCodeNotify('workbench.action.revertAndCloseActiveEditor') | else | call VSCodeNotify('workbench.action.closeActiveEditor') | endif

command! -bang Wq call <SID>saveAndClose()
command! -bang Xit call <SID>saveAndClose()

command! -bang Qall call VSCodeNotify('workbench.action.closeAllEditors')

command! -bang Wqall call <SID>saveAllAndClose()
command! -bang Xall call <SID>saveAllAndClose()

AlterCommand e[dit] Edit
AlterCommand ex Ex
AlterCommand ene[w] Enew
AlterCommand fin[d] Find
AlterCommand w[rite] Write
AlterCommand sav[eas] Saveas
AlterCommand wa[ll] Wall
AlterCommand q[uit] Quit
AlterCommand wq Wq
AlterCommand x[it] Xit
AlterCommand qa[ll] Qall
AlterCommand wqa[ll] Wqall
AlterCommand xa[ll] Xall

nnoremap ZZ <Cmd>Wq<CR>
nnoremap ZQ <Cmd>Quit!<CR>
"==============================
" Moving forward and backwards between tabs
"==============================
function! s:switchEditor(...) abort
    let count = a:1
    let direction = a:2
    for i in range(1, count ? count : 1)
        call VSCodeCall(direction ==# 'next' ? 'workbench.action.nextEditorInGroup' : 'workbench.action.previousEditorInGroup')
    endfor
endfunction

command! -complete=file -nargs=? Tabedit if empty(<q-args>) | call VSCodeNotify('workbench.action.quickOpen') | else | call VSCodeExtensionNotify('open-file', expand(<q-args>), 0) | endif
command! -complete=file Tabnew call VSCodeExtensionNotify('open-file', '__vscode_new__', 0)
command! Tabfind call VSCodeNotify('workbench.action.quickOpen')
command! Tab echoerr 'Not supported'
command! Tabs echoerr 'Not supported'
command! -bang Tabclose if <q-bang> ==# '!' | call VSCodeNotify('workbench.action.revertAndCloseActiveEditor') | else | call VSCodeNotify('workbench.action.closeActiveEditor') | endif
command! Tabonly call VSCodeNotify('workbench.action.closeOtherEditors')
command! -nargs=? Tabnext call <SID>switchEditor(<q-args>, 'next')
command! -nargs=? Tabprevious call <SID>switchEditor(<q-args>, 'prev')
command! Tabfirst call VSCodeNotify('workbench.action.firstEditorInGroup')
command! Tablast call VSCodeNotify('workbench.action.lastEditorInGroup')
command! Tabrewind call VSCodeNotify('workbench.action.firstEditorInGroup')
command! -nargs=? Tabmove echoerr 'Not supported yet'

AlterCommand tabe[dit] Tabedit
AlterCommand tabnew Tabnew
AlterCommand tabf[ind] Tabfind
AlterCommand tab Tab
AlterCommand tabs Tabs
AlterCommand tabc[lose] Tabclose
AlterCommand tabo[nly] Tabonly
AlterCommand tabn[ext] Tabnext
AlterCommand tabp[revious] Tabprevious
AlterCommand tabr[ewind] Tabrewind
AlterCommand tabfir[st] Tabfirst
AlterCommand tabl[ast] Tablast
AlterCommand tabm[ove] Tabmove

nnoremap gt <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
xnoremap gt <Cmd>call <SID>switchEditor(v:count, 'next')<CR>
nnoremap gT <Cmd>call <SID>switchEditor(v:count, 'prev')<CR>
xnoremap gT <Cmd>call <SID>switchEditor(v:count, 'prev')<CR>
" nnoremap gn <Cmd>call 
" xnoremap gn <Cmd>call 
"==============================

" Window commands
function! s:split(...) abort
    let direction = a:1
    let file = exists('a:2') ? a:2 : ''
    call VSCodeCall(direction ==# 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if !empty(file)
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
let file = a:2
call s:split(a:1, empty(file) ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorHeight(...)
let count = a:1
let to = a:2
for i in range(1, count ? count : 1)
    call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewHeight' : 'workbench.action.decreaseViewHeight')
endfor
endfunction

function! s:manageEditorWidth(...)
let count = a:1
let to = a:2
for i in range(1, count ? count : 1)
    call VSCodeNotify(to ==# 'increase' ? 'workbench.action.increaseViewWidth' : 'workbench.action.decreaseViewWidth')
endfor
endfunction

command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> ==# '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

AlterCommand sp[lit] Split
AlterCommand vs[plit] Vsplit
AlterCommand new New
AlterCommand vne[w] Vnew
AlterCommand on[ly] Only

nnoremap <C-w>s <Cmd>call <SID>split('h')<CR>
xnoremap <C-w>s <Cmd>call <SID>split('h')<CR>
nnoremap <C-w><C-s> <Cmd>call <SID>split('h')<CR>
xnoremap <C-w><C-s> <Cmd>call <SID>split('h')<CR>

nnoremap <C-w>v <Cmd>call <SID>split('v')<CR>
xnoremap <C-w>v <Cmd>call <SID>split('v')<CR>
nnoremap <C-w><C-v> <Cmd>call <SID>split('v')<CR>
xnoremap <C-w><C-v> <Cmd>call <SID>split('v')<CR>

nnoremap <C-w>n <Cmd>call <SID>splitNew('h', '__vscode_new__')<CR>
xnoremap <C-w>n <Cmd>call <SID>splitNew('h', '__vscode_new__')<CR>

nnoremap <C-w>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
xnoremap <C-w>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
nnoremap <C-w>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
xnoremap <C-w>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

nnoremap <C-w>o <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
xnoremap <C-w>o <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
nnoremap <C-w><C-o> <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
xnoremap <C-w><C-o> <Cmd>call VSCodeNotify('workbench.action.joinAllGroups')<CR>

nnoremap <C-w>j <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
xnoremap <C-w>j <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
nnoremap <C-w><C-j> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
xnoremap <C-w><C-j> <Cmd>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
nnoremap <C-w>k <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
xnoremap <C-w>k <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
nnoremap <C-w><C-i> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
xnoremap <C-w><C-i> <Cmd>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
nnoremap <C-w>h <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
xnoremap <C-w>h <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
nnoremap <C-w><C-h> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
xnoremap <C-w><C-h> <Cmd>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
nnoremap <C-w>l <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
xnoremap <C-w>l <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
nnoremap <C-w><C-l> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
xnoremap <C-w><C-l> <Cmd>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
nnoremap <C-w>w <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
xnoremap <C-w>w <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <C-w><C-w> <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
xnoremap <C-w><C-w> <Cmd>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
nnoremap <C-w>W <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
xnoremap <C-w>W <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
nnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
xnoremap <C-w>p <Cmd>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
nnoremap <C-w>t <Cmd>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
xnoremap <C-w>t <Cmd>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
nnoremap <C-w>b <Cmd>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>
xnoremap <C-w>b <Cmd>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>

nnoremap <C-w>= <Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
xnoremap <C-w>= <Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>

nnoremap <C-w>+ <Cmd>call <SID>manageEditorHeight(v:count, 'increase')<CR>
xnoremap <C-w>+ <Cmd>call <SID>manageEditorHeight(v:count, 'increase')<CR>
nnoremap <C-w>- <Cmd>call <SID>manageEditorHeight(v:count, 'decrease')<CR>
xnoremap <C-w>- <Cmd>call <SID>manageEditorHeight(v:count, 'decrease')<CR>
nnoremap <C-w>> <Cmd>call <SID>manageEditorWidth(v:count,  'increase')<CR>
xnoremap <C-w>> <Cmd>call <SID>manageEditorWidth(v:count,  'increase')<CR>
nnoremap <C-w>< <Cmd>call <SID>manageEditorWidth(v:count,  'decrease')<CR>
xnoremap <C-w>< <Cmd>call <SID>manageEditorWidth(v:count,  'decrease')<CR>

nnoremap <C-w>_ <Cmd>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <C-w>H <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>H <Cmd>echoerr 'Not supported yet'<CR>
nnoremap <C-w>L <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>L <Cmd>echoerr 'Not supported yet'<CR>
nnoremap <C-w>K <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>K <Cmd>echoerr 'Not supported yet'<CR>
nnoremap <C-w>J <Cmd>echoerr 'Not supported yet'<CR>
xnoremap <C-w>J <Cmd>echoerr 'Not supported yet'<CR>
"==============================
function! s:split(...) abort
    let direction = a:1
    let file = a:2
    call VSCodeCall(direction == 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
    if file != ''
        call VSCodeExtensionNotify('open-file', expand(file), 'all')
    endif
endfunction

function! s:splitNew(...)
    let file = a:2
    call s:split(a:1, file == '' ? '__vscode_new__' : file)
endfunction

function! s:closeOtherEditors()
    call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
    call VSCodeNotify('workbench.action.closeOtherEditors')
endfunction

function! s:manageEditorSize(...)
    let count = a:1
    let to = a:2
    for i in range(1, count ? count : 1)
        call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
    endfor
endfunction

function! s:vscodeCommentary(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [line1, line2] = [a:1, a:2]
    else
        let [line1, line2] = [line("'["), line("']")]
    endif

    call VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
endfunction

function! s:openVSCodeCommandsInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction

function! s:openWhichKeyInVisualMode()
    normal! gv
    let visualmode = visualmode()
    if visualmode == "V"
        let startLine = line("v")
        let endLine = line(".")
        call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
    else
        let startPos = getpos("v")
        let endPos = getpos(".")
        call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
    endif
endfunction


command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
command! -bang Only if <q-bang> == '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

" Better Navigation
nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

" Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
xnoremap <expr> <C-/> <SID>vscodeCommentary()
nnoremap <expr> <C-/> <SID>vscodeCommentary() . '_'

nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine
