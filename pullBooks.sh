#!/bin/bash

function pullBooks(){


    for i in $( ls ); do
        if [ -d "$i" ]; then
            # Control will enter here if $DIRECTORY exists.
            cd $i
            if [ -d ".git" ]; then
                # Needs rectifying
                # GITBRANCH=echo `__git_ps1` | cut -d "(" -f2 | cut -d ")" -f1
                # if [ "$GITBRANCH" == "master" ]; then
                git pull && cd ..
                # git remote -v && cd ..
            # else
                # # git stash
                # # git checkout master
                # # git pull
                # # git checkout $GITBRANCH
                # # git stash apply
                # # cd ..
                # echo "Please ensure you are on master branch for each repo"
            # fi
            else
                cd ..
            fi
        fi
    done
}

pullBooks
