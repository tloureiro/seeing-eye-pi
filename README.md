<img src="https://cloud.githubusercontent.com/assets/2679036/6150161/b1b4d9f6-b1db-11e4-9326-a39d65e4f719.png" alt="Seeing eye pi logo"/>


The aim of this project is to provide an environment where the seeing impaired can easily use some basic computer tools using the command line in a Raspberry Pi using Linux.


| contents |
| ------------- |
| [Easy to use](#easy-to-use) |
| [Easy to extend](#easy-to-extend) |
| [Affordable](#affordable) |
| [Current programs](#current-programs) |
| [Seeing eye pi in action](#seeing-eye-pi-in-action) |
| [Running](#running) |
| [TODO](#todo) |
| [Known issues](#known-issues) |
| [Contribute](#contribute) |
      

##Easy to use
Just a keyboard and earphones are necessary to use it. 
Textual commands are designed to be simple and logical.
The target audience for seeing eye pi are people with little or no experience with computers.

##Easy to extend
Any simple program, in any language that can read from the keyboard and output text to terminal can be used. 
Seeing eye pi is in charge of providing the keyboard feedback and reading the output produced by the applications.

##Affordable
The ultimate goal of this project is to produce an affordable portable device (under 50 dollars) that is able to perform a variety of basic tasks like accessing online information, listening to audiobooks and writing e-mails.

##Current programs
- <b>time</b>- Shows the current time
- <b>date</b>- Shows the current date
- <b>wikipedia</b>- A command line wikipedia client
- <b>help</b>- Provide some basic help on how to use seeing eye pi

##Seeing eye pi in action
A testing version of seeing eye pi (with a screen) - <a href="https://www.youtube.com/watch?v=yZOIhLYbcGA"> https://www.youtube.com/watch?v=yZOIhLYbcGA</a>

##Running
The installing/running process is not yet as simple as it should be. The ideal scenario is to have a SD card image with everything already installed and ready to be used.

<b>Prerequisites</b>

For Debian-based systems:
```bash
sudo apt-get -y install espeak fortune ruby1.9.3 libxslt1-dev libxml2-dev python-pip
sudo pip install pexpect
sudo gem install nokogiri
```
<b>then run</b> 
```bash
init_sep.sh
```

##TODO
<b>Image/Installer</b>

- Create a minimal setup (keyboard, wifi/network, sd expansion) Raspbian image with seeing eye pi and all the dependencies already installed
	
<b>Core</b>

- Read the current line capability
- Wifi conf app

<b>Apps</b>

- Audio books manager/downloader
- E-mail client
- Weather app
- Audio player
	
<b>Wikipedia</b>

- Develop subtopic navigation inside an article 
- Disambiguation articles
	
##Known issues
<b>Time</b>

- The output shouldn't contain leading zeros (instead of 09 00 AM -> 9 AM)

##Contribute
Please contribute to the project, just send me a message at tloureiro360 (gmail). Any help is very appreciated.
