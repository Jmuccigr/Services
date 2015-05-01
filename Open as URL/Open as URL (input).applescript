on process(intext)
	if items 1 through 7 of intext as string = "http://" or items 1 through 8 of intext as string = "https://" then
		open location intext
	else
		open location "http://" & intext
	end if
	return ""
end process