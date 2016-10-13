-- Hex encodes text for URIs and puts it on the clipboard
-- Based on http://macscripter.net/viewtopic.php?id=19973


on process(intext)
	set hexc to "0123456789abcdef"
	set clipboard to hex(intext)
end process

on hex(txt)
	set hx to ""
	set txt to txt as text
	
	repeat with achar in txt
		set char to ASCII number achar
		if achar is not in "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" then
			set r to char mod 16
			set d to char div 16
			set hx to hx & "%" & character (d + 1) of hexc & character (r + 1) of hexc
		else
			set hx to hx & achar
		end if
	end repeat
	
	return hx
end hex

on unhex(hex)
	
	set txt to ""
	set hex to hex as text
	set hexc to "0123456789abcdef"
	set cc to (count hex)
	if (cc mod 2 is 1) then set hex to "0" & hex
	repeat with i from 1 to cc by 2
		set n to ((offset of (character i of hex) in hexc) - 1) * 16 + (offset of (character (i + 1) of hex) in hexc) - 1
		set txt to txt & (ASCII character n)
	end repeat
	
	return txt
end unhex

