#!/bin/bash
        for i in $( ls ); do
            mv $i .$i
        done
