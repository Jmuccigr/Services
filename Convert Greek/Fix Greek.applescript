on process(greektext)
	
	global SgreekList, UnicodeList, twoLetterCodes, TLGreek
	
	set twoLetterCodes to {"ÉA", "ÖA", "ÑE", "ÉE", "ÑH", "ÜH", "ÑR", "ÑO", "ÉI"}
	set TLGreek to "ἈἌἙἘἩἭῬὉἸ"
	
	
	
	set SgreekList to "éèåãçê&ìë" as string
	set UnicodeList to "ἀἁὰάᾶἄᾳἃἅ" as string
	
	set SgreekList to SgreekList & "§•¢Ä°ß¶" as string
	set UnicodeList to UnicodeList & "ἐἑὲέέἕἔ" as string
	
	set SgreekList to SgreekList & "±≤Æ∞Ø∑˙ªæµ≥¥∏" as string
	set UnicodeList to UnicodeList & "ἠἡήῆὴἦῃῇᾔἢἤἥἧ" as string
	
	set SgreekList to SgreekList & "ﬁﬂÂ‹›·€‰‡©„" as string
	set UnicodeList to UnicodeList & "ἰἱἷὶῖἵίἶἴἳἱ" as string
	
	set SgreekList to SgreekList & "ÙıÚÒˆ˜˘" as string
	set UnicodeList to UnicodeList & "ὀὁὸόὄὅὃ" as string
	
	set SgreekList to SgreekList & "ÈÊÁÍËÏÓÔ" as string
	set UnicodeList to UnicodeList & "ὐύὺὑῦὕὓὖὗ" as string
	
	set SgreekList to SgreekList & "…≈∆«–“ƒÃÀ" as string
	set UnicodeList to UnicodeList & "ὡώὼῶῴῷῳὢὥ" as string
	
	set SgreekList to SgreekList & "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:" as string
	
	set UnicodeList to UnicodeList & "αβψδεφγηιξκλμνοπ;ρστυωςχθζΑΒΨΔΕΦΓΗΙΞΚΛΜΝΟΠ:ΡΣΤΘΩΣΧΘΖ·" as string
	
	set t to greektext as string
	set u to t
	
	-- Do the 2-letter encodings first
	repeat with i from 1 to length of twoLetterCodes
		set t to replaceText(item i of twoLetterCodes, item i of TLGreek, t)
	end repeat
	-- Then do all the rest
	repeat with i from 1 to length of SgreekList
		set t to replaceText(item i of SgreekList, item i of UnicodeList, t)
	end repeat
	
	return t
	
end process

on replaceText(find, replace, subject)
	set prevTIDs to text item delimiters of AppleScript
	considering case
		set text item delimiters of AppleScript to find as string
		set subject to text items of subject
		
		set text item delimiters of AppleScript to replace as string
		set subject to "" & subject
	end considering
	set text item delimiters of AppleScript to prevTIDs
	
	return subject
end replaceText
