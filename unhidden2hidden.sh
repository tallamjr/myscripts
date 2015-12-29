#!/bin/bash

# Prepends each file listed using the 'ls' command
# with a dot to render it a hidden file instead of unhidden.

        for i in $( ls ); do
            mv $i .$i
        done
