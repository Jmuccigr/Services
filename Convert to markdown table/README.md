# Convert to markdown table

This is a fairly simple wrapping of [Dr. Drang's script](http://www.leancrew.com/all-this/2012/11/markdown-table-scripts-for-bbedit/) into an OS X service, using Automator. I did have to make some changes because the script used the -p flag, but the system doesn't pass the data that way to the service and I'm not sure whether that's fixable. The script is meant for those who might not edit their markdown in BBEdit and so can't use Dr. Drang's directly. (Right now I use [MacDown](http://macdown.uranusjr.coms), which currently has no AppleScript support.)

It will take the highlighted text and replace it with a basic markdown table.

It works well coupled with the Service version of his script which turns simple markdown tables into pretty ones (also here on Github).

I include here the slightly modified perl script along with the zipped service.
