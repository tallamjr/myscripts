#!/bin/bash

# Track the previous directory
PREV_DIR=""

function uv_auto_env() {
  # Check if the directory has changed
  if [[ "$PWD" != "$PREV_DIR" ]]; then
    PREV_DIR="$PWD"  # Update the tracked directory

    # Path to the uv `.venv` configuration file
    conffile="$PWD/.venv/pyvenv.cfg"

    # Check if the .venv folder and configuration file exist
    if [[ -f "$conffile" ]]; then
      # Check if `uv` exists in the conffile
      if grep -q "uv" "$conffile"; then
        # Check if the environment is already active
        if [[ -z "$VIRTUAL_ENV" || "$VIRTUAL_ENV" != "$PWD/.venv" ]]; then
          echo "Detected .venv in $PWD. Activating virtual environment..."
          # Source the virtual environment
          if [[ -f "$PWD/.venv/bin/activate" ]]; then
            source "$PWD/.venv/bin/activate"
          else
            echo "Error: .venv exists but activation script not found."
          fi
        else
          echo "Virtual environment already active."
        fi
      else
        echo "Warning: 'uv' not found in $conffile. Skipping activation."
      fi
    else
      # If no .venv exists in the new directory, activate the global environment
      global_venv="$HOME/.venv"
      if [[ -z "$VIRTUAL_ENV" || "$VIRTUAL_ENV" != "$global_venv" ]]; then
        if [[ -f "$global_venv/bin/activate" ]]; then
          echo "No .venv found. Activating global virtual environment..."
          source "$global_venv/bin/activate"
        else
          echo "Error: Global virtual environment not found at $global_venv."
        fi
      fi
    fi
  fi
}

# Set PROMPT_COMMAND to invoke uv_auto_env on directory changes
PROMPT_COMMAND=uv_auto_env
