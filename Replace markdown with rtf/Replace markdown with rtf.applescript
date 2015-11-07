-- Script to take a selected bit of markdown and turn it into rtf. For Automator.

on run (input)
	set input to the quoted form of (input as string)
	try
		return (do shell script "echo " & input & " | /usr/local/bin/pandoc -s -t rtf" as Çclass RTF È)
		beep
	on error errMsg
		display alert "Error" message errMsg
	end try
end run
