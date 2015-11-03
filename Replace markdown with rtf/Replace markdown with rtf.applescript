-- Script to take a selected bit of markdown and turn it into rtf, pasting it from the clipboard

on process(input)
	set input to the quoted form of input
	try
		do shell script "echo " & input & " | /usr/local/bin/pandoc -s -t rtf | pbcopy"
		tell application "System Events"
			keystroke "v" using command down
		end tell
		beep
	on error errMsg
		display alert "Error" message errMsg
	end try
end process
