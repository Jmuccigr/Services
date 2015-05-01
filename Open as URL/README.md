# Open as URL

A simple script that takes the selected text and opens it as a URL using the default browser.

It does some minor sanity checking by looking for "http://" or "https://" at the start of the string. If they're not there, it just sends the text to the browser. This way it handles a URL given without the protocol at the start.