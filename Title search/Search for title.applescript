-- Search the usual suspects for academic titles
-- Set the name of the browser up top. Currently handles Safari and FireFox.

on run
	set browserRunning to false
	set browserName to "Safari"
	set theTitle to the clipboard as Unicode text
	set fixedTitle to (do shell script "echo " & quoted form of theTitle & " | tr  ' ' '+' ")
	--set fixedTitle to (do shell script "a=`pbpaste`; echo $a | sed 's/ /+/g'") as Unicode text
	set starts to {"https://u1lib.org/s/", "https://booksc.org/s/", "https://duckduckgo.com/?ia=web&q=", "https://www.worldcat.org/search?qt=worldcat_org_all&q=", "https://scholar.google.com/scholar?q=", "https://www.researchgate.net/search.Search.html?query=", "https://www.academia.edu/search?q=", "https://www.persee.fr/search?ta=article&q=", "https://www-jstor-org.ezproxy.amherst.edu/action/doBasicSearch?Query="}
	
	-- Make sure the browser is running. FireFox will open separate windows when it starts otherwise.
	repeat until browserRunning is true
		tell application browserName to activate
		tell application "System Events" to set browserRunning to (the name of every process contains browserName)
	end repeat
	delay 1
	
	-- Open a new browser window
	if browserName = "Safari" then
		tell application browserName to make new document
	else -- browser = "FireFox"
		tell application "System Events" to keystroke "n" using command down
	end if
	repeat with i from 1 to 2
		try
			do shell script ("open -a /Applications/" & browserName & ".app " & quote & item i of starts & theTitle & "?order=bestmatch" & quote)
		on error errMsg number errNum
			display alert "Error" message errMsg
		end try
	end repeat
	repeat with i from 3 to (count of starts)
		try
			do shell script ("open -a /Applications/" & browserName & ".app " & quote & item i of starts & fixedTitle & quote)
		on error errMsg number errNum
			display alert "Error" message errMsg
		end try
	end repeat
end run
