on process(intext)
	do shell script "open -a /Applications/Firefox.app " & quote & "http://www.worldcat.org/search?qt=worldcat_org_all&q=" & intext & quote
end process
