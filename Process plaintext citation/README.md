# Process plaintext citation

This service relies on [anystyle](https://github.com/inukshuk/anystyle) to convert the selected text into a bibtex citation that you can import into Zotero or whatever citation manager you use.

I stuck the ruby script into the AppleScript so that there are no extra parts, except that you need to install anystyle on your own. I also use rbenv to manage my ruby installation, so the script assumes that you do as well and that's it's in the same place mine is. It should be fairly easy to tweak the AppleScript of the service to change that.
