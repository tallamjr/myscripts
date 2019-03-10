#!/bin/bash

function conda_auto_env() {
  if [ -e "environment.yml" ]; then
    # echo "environment.yml file found"
    # ENV=$(head -n 1 environment.yml | cut -f2 -d ' ')
    ENV=`grep 'name:' environment.yml | tail -n1 | awk '{ print $2}'`

    # Check if you are already in the environment
    if [[ $PATH != *$ENV* ]]; then
      # Check if the environment exists
      conda activate $ENV
      if [ $? -eq 0 ]; then
        :
      else
        # Create the environment and activate
        echo "Conda env '$ENV' doesn't exist."

        while true; do
            select choice in CREATE IGNORE
            do
                echo "$REPLY : $choice"
                break
            done

            case $choice in
                "CREATE" )
                    echo "Creating new conda environment from 'environment.yml' file found in folder..";
                    sleep 2;
                    conda env create -q;
                    conda activate $ENV;
                    break ;;
                "IGNORE" )
                    echo "Ceasing creating of new conda environment";
                    break ;;
                * )
                    echo "Dafuq was that you entered?! Choose 1, or 2 fool!" ;;
            esac
        done
      fi
    fi
  fi
}

export PROMPT_COMMAND=conda_auto_env
