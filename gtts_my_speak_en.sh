#!/bin/bash

# play /home/joao/gtts_my_speak/hello.mp3

MY_USER_DIR="/home/joao"

TXT_A="/dev/shm/speak_a.txt"
TXT_B="/dev/shm/speak_b.txt"

# save X text selection to a file
xclip -out > $TXT_A

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
        s/[^a-z]IPv6[^a-z]/I P version 6/g;
        s/[^a-z]MR[^a-z]/merge request/g;
        s/[^a-z]btw[^a-z]/by the way/g;
        s/[^a-z]WIP[^a-z]/work in progress/g;
        s/[^a-z]CLI[^a-z]/command line/g;
        s/i\.e\./that is/g;
        s/e\.g\./for example/g;
        ' $TXT_A

$MY_USER_DIR/anaconda3/bin/python $MY_USER_DIR/gtts_my_speak/gtts_remove_newlines_intel.py $TXT_A $TXT_B

sleep 1.0
$MY_USER_DIR/anaconda3/bin/gtts-cli -f $TXT_B | play -t mp3 - tempo 1.3

# /home/joao/anaconda3/bin/gtts-cli -l en -f $TXT -o /dev/shm/speak.mp3  
# play /dev/shm/speak.mp3
