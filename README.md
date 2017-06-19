# Highlighter
The Repository for the Swift Syntax Highlighter Project

This was a weekend project to create a generic syntax highlighter for C-like languages in Swift. 
You can read the [Blog Post](http://www.joelcummings.ca/blog/2017/6/18/basic-syntax-highlighting-using-swift) if you want more information.

This syntax highlighter is suitable for static code. It accepts a string and returns tokens which 
can be passed to the Colourizer to add foreground attributes to your NSAttributedString container. 

It can be extended for other languages using dictionaries to define their keywords and comments. 

This is centered around a simple OS X app that demos its usage. 
