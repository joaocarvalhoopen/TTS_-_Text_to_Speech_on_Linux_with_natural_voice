#!/bin/bash

# Kills the play processes that are playing the audio from gtts, and only those.

ps aux | grep "play -t mp3 -"| grep -v grep | awk '{print $2}' | xargs kill

