#!/bin/bash

#play hello.mp3

TXT="/dev/shm/speak.txt"

# save X text selection to a file
xclip -out > $TXT

# remove smiles
#sed -i 's/ :[pP]/./' $TXT
#sed -i 's/ :\//./' $TXT
#sed -i 's/ :D/./' $TXT
#sed -i 's/ ;D/./' $TXT
#sed -i 's/ :(/./' $TXT

# Abbreviations:
#sed -i 's/[^a-z]IPv6[^a-z]/I P version 6/gi' $TXT
#sed -i 's/[^a-z]MR[^a-z]/merge request/gi' $TXT
#sed -i 's/[^a-z]btw[^a-z]/by the way/gi' $TXT
#sed -i 's/[^a-z]WIP[^a-z]/work in progress/gi' $TXT
#sed -i 's/[^a-z]CLI[^a-z]/command line/gi' $TXT

# Latin
#sed -i 's/i\.e\./that is/gi' $TXT
#sed -i 's/e\.g\./for example/gi' $TXT

sed -i 's/ :[pP]/./g;
        s/ :\//./g;
        s/ :D/./g;
        s/ ;D/./g;
        s/ :(/./g;
        s/[^a-z]IPv6[^a-z]/I P version 6/gi;
        s/[^a-z]MR[^a-z]/merge request/gi;
        s/[^a-z]btw[^a-z]/by the way/gi;
        s/[^a-z]WIP[^a-z]/work in progress/gi;
        s/[^a-z]CLI[^a-z]/command line/gi;
        s/i\.e\./that is/gi;
        s/e\.g\./for example/gi;
        '$TXT

sleep 1.5
/home/joao/anaconda3/bin/gtts-cli -f $TXT | play -t mp3 - tempo 1.25

# /home/joao/anaconda3/bin/gtts-cli -l en -f $TXT -o /dev/shm/speak.mp3  
# play /dev/shm/speak.mp3
