# Normalize markdown table

This is a fairly simple wrapping of [Dr. Drang's script](http://www.leancrew.com/all-this/2012/11/markdown-table-scripts-for-bbedit/) into an OS X service, using Automator. For those who might not edit their markdown in BBEdit. (Right now I use [MacDown](http://macdown.uranusjr.coms), which currently has no AppleScript support.)

It will take the highlighted text and replace it with a nicely formatted markdown table, with spacing to make the formatting visually clear. If the selected text is not a table, you'll get an error.

It works well coupled with my translated AppleScript version of his script which converts tab-separated text into simple markdown tables (also here on Github).

I include here the slightly modified python script along with the zipped service.
