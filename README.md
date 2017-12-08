# [Antigrapheus](https://dcthree.github.io/antigrapheus/)

In-browser OCR of Ancient Greek and Latin. Built on:

* [Tesseract.js](http://tesseract.projectnaptha.com/), a JavaScript port of the Tesseract OCR engine
* [Ancient Greek OCR](https://ancientgreekocr.org/) training file for Tesseract
* [Latin OCR](https://ryanfb.github.io/latinocr/) training file for Tesseract
* [clipboard.js](https://clipboardjs.com/), for easy copy/pasting of OCR'd text

Antigrapheus aims to be no better or worse than you would get from downloading, installing, and configuring Tesseract, but without the need to do all those things.

## FAQ

**Will this work on images of manuscripts or handwritten texts?**

As Tesseract is designed for printed materials, and the training files used are all trained on images of printed texts, Antigrapheus will likely only work on printed texts.

**Do you retain any uploaded images?**

Because all the processing is done with client-side JavaScript, we neither receive nor retain any images from users.
