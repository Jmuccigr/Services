on run {input, parameters}
	if input contains "," then
		set tid to AppleScript's text item delimiters
		set AppleScript's text item delimiters to ","
		set itemList to the text items of input
		set AppleScript's text item delimiters to return
		set itemList to the text items of itemList
		set AppleScript's text item delimiters to tid
	else
		set itemList to input
	end if
	repeat with wikiTerm in itemList
		open location "http://en.wikipedia.org/wiki/Special:Search?search=" & wikiTerm & "&go=Go"
	end repeat
end run