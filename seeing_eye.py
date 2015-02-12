import pexpect
import os

from EspeakQueue import EspeakQueue

sep_folder = os.path.dirname(os.path.realpath(__file__))

dict = {
    "\x7f": "backspace",
    "\r": "enter",
    "\"": "quote",
    " ": "space",
    "\t": "tab",
    "\x1b[A": "up",
    "\x1b[B": "down",
    "\x1b[C": "right",
    "\x1b[D": "left",

    "\x1bOP": "F1",
    "\x1b[[A": "F1",

    "\x1bOQ": "F2",
    "\x1b[[B": "F2",

    "\x1bOR": "F3",
    "\x1b[[C": "F3",

    "\x1bOS": "F4",
    "\x1b[[D": "F4"
}

lambda_dict = {
    "\x1bOP": lambda : espeak_queue.reset(), #F1
    "\x1b[[A": lambda : espeak_queue.reset(), #F1

    "\x1bOQ": lambda : toggle_keyboard_sound(), #F2
    "\x1b[[B": lambda : toggle_keyboard_sound(), #F2
}

blacklist_output_list = [
    "\x08\x1b[K",
    "\r\x1b[K",
    "\x07",
    "\x03",
    "\x1b[C",
    "\x1b[D",
    "\x1b[[A",
    "\x1b[[B"
]

s = ''
keyboard_sound = True
last_input = ''

def toggle_keyboard_sound():
    global keyboard_sound
    keyboard_sound = not keyboard_sound



def input_filter(input):

    global last_input, p_aplay
    last_input = input

    if input in lambda_dict:
        lambda_dict[input]()

    if keyboard_sound:
        if input.isalnum():
            os.system('aplay '+sep_folder+'/sounds/'+input+'.wav 2>/dev/null &')
        else:
            if input in dict:
                os.system('aplay '+sep_folder+'/sounds/'+dict[input]+'.wav 2>/dev/null &')
            else:
                os.system('aplay '+sep_folder+'/sounds/notfound.wav 2>/dev/null &')
                print input.encode(encoding='string_escape'),


    if input not in lambda_dict:
        return input
    else:
        return ''

def output_filter(output):

    if last_input == "\r":
        global espeak_queue
        espeak_queue.add(output)

    return output



espeak_queue = EspeakQueue()
espeak_queue.add("Seeing eye pi. Welcome")
espeak_queue.start()

p = pexpect.spawn('/bin/bash', ["--rcfile",  sep_folder + "/rcfile"])


p.interact(input_filter=input_filter, output_filter=output_filter)