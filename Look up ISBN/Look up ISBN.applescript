on run {input, parameters}
	-- Initialize some variables
	set final to ""
	set wrongLength to false
	set ISBNLookupURL to "https://isbnsearch.org/isbn/"
	
	set inputString to input as string
	-- Don't waste time if string is too short to possibly be an ISBN which must contain 10 or 13 numbers.
	if the number of characters in inputString > 9 then
		-- Strip non-number characters
		repeat with i in items of inputString
			if "0123456789" contains i then set final to final & i
		end repeat
		if number of characters in final is not in {10, 13} then set wrongLength to true
	else
		set wrongLength to true
	end if
	if wrongLength then
		display alert "Wrong length!" message "The input string should consist of 10 or 13 numbers, but does not." & return & return & "Input string: " & characters 1 through 20 of (inputString & "                    ")
	else
		open location ISBNLookupURL & final
	end if
end run