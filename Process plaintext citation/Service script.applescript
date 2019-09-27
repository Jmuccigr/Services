on run {input, parameters}
	# Select the ruby that rbenv is using since it's not the Apple-installed one
	set rubypath to (do shell script "/usr/local/bin/rbenv which ruby")
	# It's a short ruby script, so let's just include it directly
	set rbscript to "require 'anystyle'
v1 = ARGV[0].dup
v2 = v1.force_encoding(\\" & quote & "UTF-8\\" & quote & ")
print AnyStyle.parse(v2, format: :bibtex).to_s
exit"
	try
		# Use the ruby script to generate the citation in bibtex, and delete the key, as Zotero will add that
		set cite to do shell script (rubypath & " -e " & quote & rbscript & quote & " " & (quoted form of (input as Unicode text)) & " | perl -pe 's/\\{[a-z0-9]+,/{/'")
		# Insert the original plaintext citation as a note in case the script gets something wrong
		set lc to the number of paragraphs of cite
		set cite to paragraphs 1 thru (lc - 1) of cite & ",  note = {" & (input as Unicode text) & "}
}"
	on error errMsg number errNum
		display alert "Error " & errNum message errMsg
	end try
end run