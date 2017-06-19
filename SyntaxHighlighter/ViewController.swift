//
//  ViewController.swift
//  SyntaxHighlighter
//
//  Created by Joel Cummings on 2017-06-16.
//  Copyright © 2017 Joel Cummings. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let text = textView.attributedString()
        
        var contents = text.string
        var mutableAttributed = NSMutableAttributedString(attributedString: self.textView.attributedString())
        
        let lexer = CLike(content: contents)
        let tokens = lexer.lex()
        
        let colour = ObsidanScheme()
        
        if let textStore = self.textView.textStorage {
            colour.colourize(string: textStore, using: tokens)
        }
        
        self.textView.backgroundColor = colour.background!
        
        // Do any additional setup after loading the view.
    }
    
    func loadPlist() {
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

