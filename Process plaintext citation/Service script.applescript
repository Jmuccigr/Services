on run {input, parameters}
	# Select the ruby that rbenv is using since it's not the Apple-installed one
	set rubypath to (do shell script "/usr/local/bin/rbenv which ruby")
	# Set the path to the ruby script, wherever it lives (in this case inside the service)
	set n to short user name of (system info)
	set rbscript to "/Users/" & n & "/Library/Services/Process\\ citation.workflow/Contents/anystyle.rb"
	try
		# Trim the input text
		set input to (do shell script "echo " & quoted form of (input as Unicode text) & " | xargs")
		# Use the ruby script to generate the citation in bibtex, and delete the key, as Zotero will add that
		set cite to do shell script (rubypath & " " & rbscript & " " & (quoted form of (input as Unicode text)) & " | perl -pe 's/\\{[a-z0-9]+,/{/'")
		# Insert the original plaintext citation as a note in case the script gets something wrong
		set lc to the number of paragraphs of cite
		set cite to paragraphs 1 thru (lc - 1) of cite & ",  note = {" & (input as Unicode text) & "}
}"
	on error errMsg number errNum
		display alert "Error " & errNum message errMsg
	end try
end run