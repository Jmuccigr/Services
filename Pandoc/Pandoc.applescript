-- Uses installed version of pandoc to do a simple conversion of one file to another.

on run {input, parameters}
	tell application "Finder"
		set f to the input as alias
		set theFile to the POSIX path of f
		set theFolder to (the parent of f) as alias
		set theName to the name of f
		set shortName to my getName(theName)
		set done to false
		
		repeat until done
			set theExtension to the text returned of (display dialog "The target file will be saved in the same location as the original, with the same name." & return & return & "What should be the extension of the target file?" default answer "md")
			set theNewFile to ((theFolder as string) & shortName & "." & theExtension)
			try
				theNewFile as alias
				set warningReply to display alert "File exists!" message "A file exists with the new name. Do you want to overwrite it?" buttons {"Cancel", "Pick another name", "Yes"} default button "Yes" cancel button "Cancel"
				if button returned of warningReply is "Yes" then
					set done to true
					error "Dummy error to invoke command"
					--else
					--	if button returned is "Cancel" then set done to false
				end if
			on error errMsg
				if errMsg is "Finder got an error: User canceled." then
					set done to true
				else
					set theNewFile to the POSIX path of theNewFile
					my pdoc(theFile, theNewFile)
					set done to true
				end if
			end try
		end repeat
	end tell
end run

-- Run the command
on pdoc(oldFile, newFile)
	set shcmd to "export PATH=/usr/local/bin:/usr/local/sbin:/usr/texbin:$PATH; "
	set pdcmd to "-s --atx-headers --latex-engine=xelatex "
	try
		do shell script (shcmd & "pandoc " & pdcmd & the quoted form of oldFile & " -o " & the quoted form of newFile)
	on error errMsg
		display alert "Oops" message "There was an error:" & return & return & items 1 thru 300 of errMsg & return & return & "(The entire error messages has been put on the clipboard.)" giving up after 30
		
		set the clipboard to errMsg
	end try
end pdoc

-- Get filename without extension
on getName(fileName)
	set delims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to "."
	set myNames to {}
	if fileName contains "." then set fileName to (text items 1 thru -2 of fileName) as text
	set AppleScript's text item delimiters to delims
	return fileName
end getName