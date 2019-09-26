on run {input, parameters}
	# Set the path to the ruby script, wherever it lives (in this case inside the service)
	set n to short user name of (system info)
	set pp to "/Users/" & n & "/Library/Services/Process\\ citation.workflow/Contents/anystyle.rb"
	try
		# Use the ruby script to generate the citation in bibtex, and delete the key, as Zotero will add that
		set cite to do shell script (pp & " " & (quoted form of (input as Unicode text)) & " | perl -pe 's/\\{[a-z0-9]+,/{/'")
		# Insert the original plaintext citation as a note in case the script gets something wrong
		set lc to the number of paragraphs of cite
		set cite to paragraphs 1 thru (lc - 1) of cite & ",  note = {" & (input as text) & "}
}"
	on error errMsg number errNum
		display alert "Error " & errNum message errMsg
	end try
end run