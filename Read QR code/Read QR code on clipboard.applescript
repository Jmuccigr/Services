on run
	tell application "Finder"
		set i to item 1 of (clipboard info) as string
	end tell
	if i contains "PNGf" then
		set filename to ((random number) * 10000000 as integer)
		set theFile to ((do shell script "echo $TMPDIR") & filename & ".png")
		set png_data to the clipboard as «class PNGf»
		set the_file to (open for access POSIX path of (POSIX file theFile) with write permission)
		write png_data to the_file
		close access the_file
		set theQRcode to (do shell script "/opt/homebrew/bin/zbarimg -q -1 " & theFile & " | grep QR | sed 's/QR\\-Code\\://'")
		if theQRcode is not "" then
			if theQRcode contains "http" then
				open location theQRcode
			else
				display dialog theQRcode
			end if
		else
			display alert "No QR Code" message "No QR code was found on the clipboard." as warning giving up after 30
		end if
	else
		display alert "No image" message "No image is on the clipboard." as warning giving up after 30
	end if
end run

