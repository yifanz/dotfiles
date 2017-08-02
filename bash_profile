#!/bin/bash

# ~/.bash_profile only execute for login shells.
# ~/.bashrc only executes for non-login shells.
# This makes sure that .bashrc is always executed for login shells.

BASHRC=~/.bashrc

if [[ -f "$BASHRC" ]]; then
    source "$BASHRC"
fi
