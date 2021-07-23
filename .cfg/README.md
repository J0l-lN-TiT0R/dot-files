# My collection of dotfiles

## Preparation

Make an alias for working with the config folder  
`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`

Make sure that source repository ignores the config folder to avoid recursion problems  
`echo ".cfg" >> .gitignore`

Clone into a bare repository  
`git clone --bare https://github.com/J0l-lN-TiT0R/dot-files $HOME/.cfg`

Checkout the actual content from the bare repository to your $HOME  
`config checkout`

Set the flag `showUntrackedFiles` to no on this specific (local) repository:  
`config config --local status.showUntrackedFiles no`
