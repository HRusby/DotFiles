# DotFiles
Source of DotFiles

Set up on new system:

    DotFileDirectory=".cfg"
    DotFileRepoUrl=""
    
    #Add Alias to current shell and bashrc and add location to .gitignore
    echo "alias config='/usr/bin/git --git-dir=$HOME/$DotFileDirectory/ --work-tree=$HOME'" >> $HOME/.bashrc
    alias config='/usr/bin/git --git-dir=$HOME/$DotFileDirectory/ --work-tree=$HOME'
    echo "$DotFileDirectory" >> .gitignore
    
    # Clone Remote repo to defined location
    git clone --bare $DotFileRepoUrl $HOME/$DotFileDirectory
    config checkout
    config config --local status.showUntrackedFiles no
