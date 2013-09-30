require 'curses'

win = Curses::Window.new(0, 0, 0, 0)

Curses.init_screen
Curses.cbreak
Curses.nonl
Curses.stdscr.keypad(true)

line = ""
loop do
    a = Curses.getch
    
    if a == 13 #enter
		system("espeak \"" + line + "\" --stdout | aplay 2>/dev/null")
		
		output = `#{line}` 
		Curses.setpos(0,0)
		Curses.addstr(line + "\n" + output);
		Curses.refresh
		Curses.setpos(0,0)

		system("espeak \"" + output + "\" --stdout | aplay 2>/dev/null")
		
		
		line = ""
		Curses.clear
		
	elsif a == " "
		line += a.to_s
		system("aplay space.wav 2>/dev/null &")
	elsif a == 263 #backspace
		system("aplay backspace.wav 2>/dev/null &")
		line.chop!
	else
		line += a.to_s
		system("aplay " + a.to_s  + ".wav 2>/dev/null &")
	end
end

win.close


