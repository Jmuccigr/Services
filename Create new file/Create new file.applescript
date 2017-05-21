-- Create a new text file in the current folder

tell application "Finder"
	set i to 2
	set saved to false
	set dir to ""
	
	-- Use the frontmost window info directly, but...
	-- Use the Desktop, if there is no open window.
	try
		set f to the target of the front window
		set dir to the POSIX path of (f as string)
	on error
		-- There is no open window.
		set f to the desktop
		set dir to the POSIX path of (container of f as string) & "Desktop/"
	end try
	
	-- Now create the file name and "touch" it to create it.
	set stamp to do shell script "date +%Y%m%d.%H%M%S"
	set fname to dir & stamp & ".txt"
	repeat until saved
		try
			-- Don't just touch an existing file...which is VERY unlikely given how the file is named.
			if (exists POSIX file fname as alias) then
				set fname to dir & stamp & "_" & (i as string) & ".txt"
				set i to i + 1
			end if
		on error
			do shell script "touch " & quoted form of fname
			set saved to true
		end try
	end repeat
	
end tell