# Pandoc

This is a simple AppleScript that uses Pandoc to convert the selected file to another format. It doesn't do much error checking and works on only one file right now.

It uses xelatex to allow \setmainfont in the config file.

* 2015-10-16 - Added error check for pre-existing file with same name as the target.