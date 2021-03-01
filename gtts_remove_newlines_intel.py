#!/usr/bin/env python

# This program removes the \n (newlines) if it isn't in the end
# of a sentence, that terminates with a dot. 

import sys

print(str(sys.argv))
if len(sys.argv) != 3:
    print(f"Usage: python gtts_remove_newlines_intel.py  /dev/shm/speak_a.txt /dev/shm/speak_b.txt")
    exit()

file_input_name  = sys.argv[1]
file_output_name = sys.argv[2]

file_input = open(file_input_name, "r")
input_lines = file_input.readlines()
file_input.close()

lst = []
flag_removed_last_line_newline = False
for line in input_lines:
    # New Line to be removed if not at the end of a phrase
    # terminated with a dot.
    if line.endswith("\n") and not line.endswith(".\n"):
        lst.append(line[:-1])
        lst.append(" ")
        flag_removed_last_line_newline = True
    else:
        # Normal line.
        if flag_removed_last_line_newline:
            # Corrects the removed \n (new line), by putting it
            # back again. If the the current line starts with a
            # upper case. 
            if len(line) > 0 and line[0].isupper():
                del lst[-1]
                lst.append("\n")
        lst.append(line)
        flag_removed_last_line_newline = False

text_output = "".join(lst)

print(text_output)

file_output = open(file_output_name, "w")
file_output.write(text_output)
file_output.close()

