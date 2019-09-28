on run {input, parameters}
	# Select the ruby that rbenv is using since it's not the Apple-installed one
	set rubypath to (do shell script "/usr/local/bin/rbenv which ruby")
	# It's a short ruby script, so let's just include it directly
	set rbscript to "require 'anystyle'\rv1 = ARGV[0].dup\rv2 = v1.force_encoding(\\" & quote & "UTF-8\\" & quote & ")\rprint AnyStyle.parse(v2, format: :bibtex).to_s\rexit"
	try
		# Use this weird method to remove line breaks in text. This means just one cite per shot. I couldn't get
		# anything else to remove \n. We're taking over the clipboard anyway.
		set input to (do shell script ("a=`pbpaste`; echo $a"))
		# Use the ruby script to generate the citation in bibtex, and delete the key, as Zotero will add that
		set cite to do shell script (rubypath & " -e " & quote & rbscript & quote & " " & (quoted form of (input as Unicode text)) & " | perl -pe 's/\\{[a-z0-9]+,/{/'")
		# Insert the original plaintext citation as a note in case the script gets something wrong
		set lc to the number of paragraphs of cite
		set cite to paragraphs 1 thru (lc - 1) of cite & ",  note = {" & (input as Unicode text) & "}\r}"
	on error errMsg number errNum
		display alert "Error " & errNum message errMsg
	end try
end run