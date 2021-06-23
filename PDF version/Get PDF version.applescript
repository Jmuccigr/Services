-- A script to display the PDF version of the selected PDF files

on run {input, parameters}
	set output to ""
	repeat with f in input
		tell application "Finder" to set fname to (the name of f as string)
		set input to quoted form of (POSIX path of f)
		set PDFversion to do shell script "/usr/local/bin/pdfinfo " & input & " 2>/dev/null | grep 'PDF version:' | perl -pe  's/^.*\\:+\\s+//'\t"
		set output to output & fname & ": " & PDFversion & return & return
	end repeat
	display alert "PDF Version" message output
end run