### Vim Live Server
 A dead-simple live server implementation using [browser-sync](https://www.npmjs.com/package/browser-sync).
 
 Preview your code in your browser as you change it with ease.

### Dependency
- nodejs 
- npm
1. Install the `browser-sync` package globally using npm:

```
   sudo npm install -g browser-sync
```
2. Use your favorite Vim plugin manager to install `vim-live-server`.
### Installation
#### Resolve Dependency


#### Using [vim-plug](https://github.com/junegunn/vim-plug)

Add the following line to your plugin configuration in your .vimrc file:
```
Plug 'https://github.com/wolandark/vim-live-server.git'
```
With vimplug you can use this alternative command that uses a post-installation hook to download the browser-sync package from npm automatically:

```
Plug 'https://github.com/wolandark/vim-live-server.git', { 'do': 'sudo npm install -g browser-sync' }
```

#### Using [Vundle](https://github.com/VundleVim/Vundle.vim)

```
Plugin 'https://github.com/wolandark/vim-live-server.git'
```

#### Using [Pathogen](https://github.com/tpope/vim-pathogen)

Clone the vim-live-server repository into your Vim bundle directory:
```
cd ~/.vim/bundle
git clone https://github.com/wolandark/vim-live-server.git
```

### Usage
Open your index.html file in vim and issue the following in ex-mode. The server will start and bind itself to `localhost:3000`

```
StartBrowserSync
```

To start serving on a specific port, use:
```
StartBrowserSyncOnPort N
StartBrowserSyncOnPort 3009
```

To kill the server on the default port 3000 use this:
```
KillBrowserSync
```
Use this command to kill the server on a certain port:
```
KillBrowserSyncOnPort N
KillBrowserSyncOnPort 3006
```
vim-live-server will kill all running instances of browser-sync on [VimLeave](https://vimhelp.org/autocmd.txt.html#VimLeave).

### Optional keybindings
```
nmap <F2> :StartBrowserSync <CR>
nmap <F3> :KillBrowserSync <CR>
```

### Thats it!
Enjoy!

### Demo
https://github.com/wolandark/browser-sync/assets/107309764/218cb8a0-459a-43cd-a987-1b43d1fb2b92

### Contact me
[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/wolandarkside)
[![Protonmail](https://img.shields.io/badge/ProtonMail-8B89CC?style=for-the-badge&logo=protonmail&logoColor=white)](mailto:contact-woland@proton.me)
