-- Uses installed version of pandoc to do a simple conversion of one file to another.

-- Uses installed version of pandoc to do a simple conversion of one file to another.

on run {input, parameters}
	tell application "Finder"
		set f to the input as alias
		set theFile to the quoted form of the POSIX path of f
		set theFolder to the POSIX path of ((the parent of f) as alias)
		set theName to the name of f
		set shortName to my getName(theName)
		
		set theExtension to the text returned of (display dialog "The target file will be saved in the same location as the original, with the same name." & return & return & "What should be the extension of the target file?" default answer "md")
		
		set shcmd to "export PATH=/usr/local/bin:/usr/local/sbin:/usr/texbin:$PATH; "
		try
			do shell script (shcmd & "pandoc -s " & theFile & " -o " & the quoted form of (theFolder & shortName & "." & theExtension))
		on error errMsg
			display alert "Oops" message "There was an error:" & return & return & items 1 thru 300 of errMsg & return & return & "(The entire error messages has been put on the clipboard.)" giving up after 30
			
			set the clipboard to errMsg
		end try
	end tell
end run


-- Get filename without extension
on getName(fileName)
	set delims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to "."
	set myNames to {}
	if fileName contains "." then set fileName to (text items 1 thru -2 of fileName) as text
	set AppleScript's text item delimiters to delims
	return fileName
end getName