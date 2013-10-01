#Seeing Eye Pi
The aim of this project is to provide an environment where seeing impaired people can easily use some basic computer tools using the command line in a Raspberry Pi.
###The demo:
I made a demonstration script (it's located inside the test folder) to show how this system would work.
I used a Raspberry Pi model B with Raspbian as the operating system. I used a US keyboard to run it.
###To run the demo:
1) Follow this excelent tutorial on how to make audio out works on Raspberry Pi
http://jeffskinnerbox.wordpress.com/2012/11/15/getting-audio-out-working-on-the-raspberry-pi/

2) Install espeak (speech synthesizer)
In the terminal run:
sudo apt-get install espeak

3) Install ruby:
sudo apt-get install ruby1.9.3

4) Run the demo:
Go to the test folder and run
ruby v3.rb

###How to use it:
Enter any linux command with simple output and press enter

For example:
date (press enter)

A good way to test is to install the "fortune" application.
fortune prints out a random quotation from a database into the terminal

To install fortune run:
sudo apt-get install fortune

And then inside the demo you can run:
fortune<enter>
