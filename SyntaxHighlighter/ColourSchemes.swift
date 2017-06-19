//
//  ColourSchemes.swift
//  SyntaxHighlighter
//
//  Created by Joel Cummings on 2017-06-18.
//  Copyright © 2017 Joel Cummings. All rights reserved.
//

import Foundation
import AppKit

class ColourScheme {
    
    var background: NSColor?
    var foreground: NSColor?
    var textScheme: [TokenType: NSColor?]?
    
    init(background: NSColor, foreground: NSColor, textScheme: [TokenType: NSColor?]) {
        self.background = background
        self.foreground = foreground
        self.textScheme = textScheme
    }
    
    func colourize(string: NSTextStorage, using tokens: [TokenStruct]) {
        guard let textScheme = self.textScheme else {
            return
        }
        
        for token in tokens {
            if textScheme.keys.contains(token.token){
                if let colour = textScheme[token.token] {
                    string.addAttribute(NSAttributedStringKey.foregroundColor, value: colour!, range: token.pos)
                }
            }
        }
    }
}

class ObsidanScheme: ColourScheme {
    
    let obsidian: [TokenType: NSColor?] = [
        .Numeric: NSColor(red:1.00, green:0.80, blue:0.23, alpha:1.00),
        .Parens: NSColor(red:0.91, green:0.89, blue:0.72, alpha:1.0),
        .Comment: NSColor(red:0.49, green:0.55, blue:0.58, alpha:1.0),
        .Other: NSColor(red:0.88, green:0.87, blue:0.87, alpha:1.00),
        .Keyword: NSColor(red:0.58, green:0.78, blue:0.41, alpha:1.00),
        .Word: NSColor(red:0.41, green:0.55, blue:0.66, alpha:1.00),
        .String: NSColor(red:0.92, green:0.46, blue:0.13, alpha:1.00),
        .Symbol: NSColor(red:0.81, green:0.78, blue:0.62, alpha:1.00)
        
    ]
    
    init() {
        super.init(background: NSColor(red:0.16, green:0.19, blue:0.20, alpha:1.00), foreground: NSColor.white, textScheme: self.obsidian)
    }
    
}
