" vim-live-server.vim

" A live web server for Vim
" By Wolandark
" https://github.com/wolandark/vim-live-server

if executable('browser-sync')
let s:browsersync_counter = 0
"Browser-Sync
function! StartBrowserSync()
    " let cmd = "browser-sync start --no-notify --server --cwd=" . getcwd() . " --files \"*.html, *.css, *.js\" &"
    let cmd = "browser-sync start --no-notify --server --files *.html, *.css, *.js &"
    call system(cmd)
    echo "BrowserSync started in the background."
    let s:browsersync_counter += 1
endfunction

function! StartBrowserSyncOnPort(port)
    let port_num = a:port + 0  " Convert a:port to a number
    let cmd = "browser-sync start --no-notify --server --cwd=" . getcwd() . " --port=" . port_num . " --files \"*.html, *.css, *.js\" &"
    call system(cmd)
    echo "BrowserSync started in the background on port " . port_num . "."
    let s:browsersync_counter += 1
endfunction

command! StartBrowserSync call StartBrowserSync()
command! -nargs=1 StartBrowserSyncOnPort call StartBrowserSyncOnPort(<f-args>)

if executable('pkill')
function! KillBrowserSync()
    let port = systemlist("pgrep -f 'browser-sync'")[0]
    if empty(port)
        echo "No BrowserSync server found on port 3000."
    else
        let cmd = "kill " . port
        call system(cmd)
        echo "BrowserSync server on port 3000 terminated."
    endif
    let s:browsersync_counter -= 1
endfunction

function! KillBrowserSyncOnPort(port)
    let cmd = "pgrep -f 'browser-sync.*--port=" . a:port . "' | xargs -r kill"
    call system(cmd)
    echo "BrowserSync server on port " . a:port . " terminated."
    let s:browsersync_counter -= 1
endfunction

function! KillAllBrowserSyncInstances()
    let cmd = "pkill -f 'browser-sync'"
    call system(cmd)
    let s:browsersync_counter = 0
endfunction

command! KillBrowserSync call KillBrowserSync()
command! -nargs=1 KillBrowserSyncOnPort call KillBrowserSyncOnPort(<f-args>)

augroup BrowserSyncKill
    autocmd!
    autocmd VimLeave * if s:browsersync_counter > 0 | call KillAllBrowserSyncInstances() | endif
augroup END
endif
endif

" Live-Server
if executable('live-server')
let s:livebrowser_counter = 0

function! StartLiveServer()
    let cmd = "live-server &"
    call system(cmd)
    echo "Live server started in the background."
    let s:livebrowser_counter += 1
endfunction

function! StartLiveServerOnPort(port)
    let port_num = a:port + 0  " Convert a:port to a number
    let cmd = "live-server --port=" . port_num . "&"
    call system(cmd)
    echo "Live Server started in the background on port " . port_num . "."
    let s:livebrowser_counter += 1
endfunction

" Call Commands
command! StartLiveServer call StartLiveServer()
command! -nargs=1 StartLiveServerOnPort call StartLiveServerOnPort(<f-args>)

if executable('pkill')
function! KillLiveServer()
    let port = systemlist("pgrep -f 'live-server'")[0]
    if empty(port)
        echo "No Live Server found on port 8080."
    else
        let cmd = "kill " . port
        call system(cmd)
        echo "Live Server on port 8080 terminated."
    endif
    if s:livebrowser_counter >= 0 | let s:livebrowser_counter -= 1 | endif
endfunction

function! KillLiveServerOnPort(port)
    let cmd = "pgrep -f 'live-server.*--port=" . a:port . "' | xargs -r kill"
    call system(cmd)
    echo "Live Server on port " . a:port . " terminated."
    if s:livebrowser_counter >= 0 | let s:livebrowser_counter -= 1 | endif
endfunction

function! KillAllLiveServerInstances()
    let cmd = "pkill -f 'live-server'"
    call system(cmd)
    let s:livebrowser_counter = 0
endfunction

command! KillLiveServer call KillLiveServer()
command! -nargs=1 KillLiveServerOnPort call KillLiveServerOnPort(<f-args>)

augroup LiveServerKill
    autocmd!
    autocmd VimLeave * if s:browsersync_counter > 0 | call KillAllLiveServerInstances() | endif
augroup END
endif
endif
