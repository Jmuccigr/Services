-- Script to take a selected bit of markdown and turn it into rtf, leaving it on the clipboard

on process(input)
	set input to the quoted form of input
	try
		do shell script "echo " & input & " | /usr/local/bin/pandoc -s -t rtf " & " | pbcopy; pbpaste"
		beep
	on error errMsg
		display alert "Error" message errMsg
	end try
end process
