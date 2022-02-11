-- Read the first QR code in a file and if it's a URL open it, otherwise display it

on run {input, parameters}
	set theFile to the quoted form of the POSIX path of alias input
	set theQRcode to (do shell script "/usr/local/bin/zbarimg -q -1 " & theFile & " | grep QR | sed 's/QR\\-Code\\://'")
	if theQRcode contains "http" then
		open location theQRcode
	else
		display dialog theQRcode
	end if
end run