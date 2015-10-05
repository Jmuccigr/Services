-- Create new note in the Notes app with the contents of the clipboard
-- Name it with a time stamp

tell application "Notes"
	activate
	set noteName to date string of (get current date) & " " & time string of (current date)
	tell (folder 1)
		make new note with properties {body:the clipboard, name:noteName}
	end tell
end tell