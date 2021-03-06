-- Search the usual suspects for academic titles

on run
	set theTitle to the clipboard as Unicode text
	--(do shell script "echo " & (quoted form of theTitle) & " | sed 's/ /+/g'")
	set fixedTitle to (do shell script "a=`pbpaste`; echo $a | sed 's/ /+/g'")
	set starts to {"https://1lib.us/s/", "https://booksc.org/s/", "https://duckduckgo.com/?ia=web&q=", "https://www.worldcat.org/search?qt=worldcat_org_all&q=", "https://scholar.google.com/scholar?q=", "https://www.academia.edu/search?q=", "https://www.persee.fr/search?ta=article&q=", "https://www.jstor.org/action/doBasicSearch?Query="}
	repeat with i from 1 to 2
		try
			do shell script ("open -a /Applications/Firefox.app " & quote & item i of starts & theTitle & "?order=bestmatch" & quote)
		on error errMsg number errNum
			display alert "Error" message errMsg
		end try
	end repeat
	repeat with i from 3 to (count of starts)
		try
			do shell script ("open -a /Applications/Firefox.app " & quote & item i of starts & fixedTitle & quote)
		on error errMsg number errNum
			display alert "Error" message errMsg
		end try
	end repeat
end run
