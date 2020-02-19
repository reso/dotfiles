# dotfiles
my dotfiles

# Comments on achieving color consistency between vim/gvim/linux/windows/terminals

Over the years I've tried to get the same consistent look in all the shells/vim/gvim sessions I have between
different systems.  It sounds trivial, but there would always be some hold out.  Usually it was some interplay of
$TERM environment variables when sshing between different terminals/servers and the inability of vim from the console to 
change the background of the terminal. 

Changing the background color in the terminal is done by adding the following to your colorscheme:

```
if version > 800
	set termguicolors
endif
```

## crossplatform cygwin/windows/linux dotfile setup
My setup is pretty crude and hacky, but it works for me.

### dotfiles repository ##
I usually put dotfiles in ```C:\dotfiles``` as a git repository, and importantly change this repository to not change LF line endings to CRLF with: ```git config core.autocrlf false```. 

### Windows vimrc
The windows vimrc by default is stored in ```%USERPROFILE%\_vimrc```  and it simply contains:

```
source C:\dotfiles\vimrc

if has("win32")
	let $MYVIMRC='C:/dotfiles/vimrc'
end
```

A little part of me dies every time I see that hard coded file path, but oh well.

### cygwin
I've been using cygwin for decades now, and though there are WSL and no end of VMs, it just works for me.  I create a symlink to my dotfiles and vimrc in my cygwin home folder:

```
ln -s /cygdrive/c/dotfiles dotfiles
ln -s dotfiles/vimrc .vimrc
```

Now, because the git repository should only contain LF line endings, we can use the same dotfile repository between cygwin and windows,

### Colorscheme
I'm using the Anderson colorscheme from here:  https://github.com/tlhr/anderson.vim   which I've forked and added the ```termguicolors```  https://github.com/reso/anderson.vim/commit/58287ea020c862d527bed922ba255ded4b7d2e16
