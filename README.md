# TTS - Text to Speech on Linux with natural voice
A fast method for the text that you select, PDF or EPUB.

## Description

The objective was to achieve speed reading but in a computer screen and with full comprehension, no skimming of text.
An easy to use, fast and practical method for English and Portuguese (you can customize to any language you need). <br>
<br>
The basic idea is that you open the PDF, you select the text for a page, hit the shortcut key combination and you will ear the natural TTS voice. The TTS doesn't tire you and you read along in the PDF following what the TTS voice reads you. You see the diagrams, you see the code, and the tables, it's simple and easy to use. And with a high level of comprehension. You can configure to be faster or slower by language, and you can configure to start immediately or to wait for a t seconds amount to let you position your eyes at the beginning of the selected text. <br>
<br>
**Important Note:** <br>
The text that you use, should be public, because this TTS uses the TTS online service from Google and it will send the selected text to Google so it can give back the audio in a mp3 file format. <br>
<br>
In this process we will use the ```/dev/shm``` RAM Disk so that you don't need to write to disk the text file and the text edits.


## The process

The process executes instantly. <br>

* We will use the **program xclip** to get the current selected text in a X program. We will not need to make copy and paste, only select the text and hit the short key for TTS in English or the short key for TTS on Portuguese. <br>

* We will use the **program gtts** to send the text to Google and to receive the audio in MP3. The TTS is of high natural quality. It doesn't produce fatigue. <br>
<br>
  **gtts** <br> 
  [https://github.com/pndurette/gTTS](https://github.com/pndurette/gTTS)

* Then we will pipe it to the **program play of SOX**, to play the MP3 and we will be increasing the velocity to 1.5x (configurable in the shell script).


## To install do...

```
pip install gTTS
sudo apt install xclip
sudo apt install sox
sudo apt-get install libsox-fmt-mp3

```

To test if all is correctly installed, and to ear the quality of the audio, do:

```
gtts-cli -l pt 'Bom dia!' | play -t mp3 -

```

Then we will add the two following shellscript, **where is joao you should change to your user**: <br>
<br>
**Filename: gtts_my_speak_pt.sh**

```
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

# In one single invocation to sed.
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
/home/joao/anaconda3/bin/gtts-cli -l pt -f $TXT | play -t mp3 - tempo 1.5

# /home/joao/anaconda3/bin/gtts-cli -f $TXT -o /dev/shm/speak.mp3  
# play /dev/shm/speak.mp3

```

**Filename: gtts_my_speak_en.sh**

```
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

# In one single invocation to sed.
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
/home/joao/anaconda3/bin/gtts-cli -l en -f $TXT | play -t mp3 - tempo 1.2

# /home/joao/anaconda3/bin/gtts-cli -f $TXT -o /dev/shm/speak.mp3  
# play /dev/shm/speak.mp3

```

Then it is necessary to change the permission on the shell scripts in the terminal so they become executable. <br>

```
chmod u+x ~/gtts_my_speak_pt.sh
chmod u+x ~/gtts_my_speak_en.sh

```

Then it is necessary to create the shortcuts on Ubuntu definitions:<br>
<br>
Change ```/home/joao``` to your username ```/home/username```. <br>
<br>
On the desktop of Ubuntu, right upper corner in the arrow pointing downwards -> Definition -> shortcuts in the keyboard -> Go to the end of the page -> click on the button  "+" -> Addd each of the shortcuts. <br>

```
Name: gtts - speak selected text Portuguese
Command: /home/joao/gtts_my_speak_pt.sh
keys shortcut: super + 'C cedelhado'  Choose one

Name: gtts - speak selected text English
Command: /home/joao/gtts_my_speak_en.sh
keys shortcut: super + '-'

```

**Then we will be creating the shell script to kill one or more processes of play.** Our specific play processes. <br>
<br>

**Filename: gtts_my_speak_kill.sh**

```
ps aux | grep "play -t mp3 -"| grep -v grep | awk '{print $2}' | xargs kill

```

To make the shell script executable do: <br>

```
chmod u+x ~/gtts_my_speak_kill.sh

```

Add the shortcut to kill the process, we will have 3 shortcuts in total. <br>
Change ```/home/joao``` to your username ```/home/username```. <br>

```
Name: gtts - speak selected text - Kill process
Command: /home/joao/gtts_my_speak_kill.sh
keys shortcut: super + '.'

```

Now, you only have to open a text in a browser, in a public PDF, public EPUB, or public text and hit the key combination to ear the Text to Speech. <br>
<br>
Remember that the selected text will go to Google to get the audio, so only use public text. <br>
<br>
The idea is not only a kind of audio book, but to ear the audio and follow along with fast reading, but at a pace that you are earing. This imposes to you the fast pace, so that you can endure for long texts like 500 pages or 1000 pages, hour after hour. <br>
<br>
While reading we will have a high degree of comprehension and we will learn much better the text, in comparison to only earing. And we can go back at any moment and read and ear a passage it again, see the diagrams, a table, or code. You can select a all page, multiple pages or a simple passage. 


## References
* The first two shell scripts where adapted from this page: <br>
  [https://askubuntu.com/questions/53896/natural-sounding-text-to-speech](https://askubuntu.com/questions/53896/natural-sounding-text-to-speech)


## I hope that this is useful to you 


## Have fun
Best regards, <br>
João Nuno Carvalho
