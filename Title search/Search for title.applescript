-- Search the usual suspects for academic titles

on run
	set theTitle to the clipboard
	set theTitle to (do shell script "a=`pbpaste`; echo $a | sed 's/ /+/g'")
	set starts to {"https://duckduckgo.com/?q=", "https://scholar.google.com/scholar?q=", "https://www.jstor.org/action/doBasicSearch?Query=", "https://www.academia.edu/search?utf8=✓&q=", "https://www.worldcat.org/search?qt=worldcat_org_bks&fq=dt%3Abks&q="}
	set endings to {"&ia=web", "", "", ""}
	repeat with i from 1 to count of starts
		try
			do shell script ("open -a /Applications/Firefox.app " & quote & item i of starts & theTitle & item i of endings & quote)
		on error errMsg number errNum
			display alert "Error" message errMsg
		end try
	end repeat
end run

