#!/bin/bash

# Kill all previous sessions
killall conky

# conky -c $HOME/.config/conky/conky.conf &
conky -c $HOME/.config/conky/conky_notes.conf &
