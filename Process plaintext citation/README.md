---
title: Process plaintext citation
author: John D. Muccigrosso
date: Saturday, 28 September 2019
version: 1.2
---

This service relies on [anystyle](https://github.com/inukshuk/anystyle) to convert the selected text into a bibtex citation that you can import into [Zotero](https://zotero.org/) or whatever citation manager you use. Currently the included Service tells Zotero to import the clipboard.

I stuck the ruby script into the AppleScript so that there are no extra parts, except that you need to install anystyle on your own. I also use rbenv to manage my ruby installation, so the script assumes that you do as well and that's it's in the same place mine is. It should be fairly easy to tweak the AppleScript of the service to change that.

Finally I tweak the bibtex output a bit, so that the original plaintext of the citation is stuck into the note field. That way if anystyle doesn't do what it should, you can grab the text anyway. Any previous note that anystyle creates is maintained when imported into Zotero, so this shouldn't cause any problems.

I've tested this with unicode input (like accented French letters) and titles with single and double quotation marks. Let me know if it doesn't work with something (and please check that it's not anystyle's fault).

NB In order to adjust for what can be unexpected line breaks in the selected text, the script removes them. This means that, although anystyle can handle multiple citations, the service cannot.
