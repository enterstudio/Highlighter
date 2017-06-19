//
//  ColourSchemes.swift
//  SyntaxHighlighter
//
//  Created by Joel Cummings on 2017-06-18.
//  Copyright © 2017 Joel Cummings. All rights reserved.
//

import Foundation
import UIKit

class ColourScheme {
    
    var background: UIColor?
    var foreground: UIColor?
    var textScheme: [TokenType: UIColor?]?
    
    init(background: UIColor, foreground: UIColor, textScheme: [TokenType: UIColor?]) {
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
                    
                    string.addAttribute(NSForegroundColorAttributeName, value: colour!, range: token.pos)
                    //string.addAttribute(NSAttributedStringKey.foregroundColor, value: colour!, range: token.pos)
                }
            }
        }
    }
}

class ObsidanScheme: ColourScheme {
    
    let obsidian: [TokenType: UIColor?] = [
        .Numeric: UIColor(red:1.00, green:0.80, blue:0.23, alpha:1.00),
        .Parens: UIColor(red:0.91, green:0.89, blue:0.72, alpha:1.0),
        .Comment: UIColor(red:0.49, green:0.55, blue:0.58, alpha:1.0),
        .Other: UIColor(red:0.88, green:0.87, blue:0.87, alpha:1.00),
        .Keyword: UIColor(red:0.58, green:0.78, blue:0.41, alpha:1.00),
        .Word: UIColor(red:0.41, green:0.55, blue:0.66, alpha:1.00),
        .String: UIColor(red:0.92, green:0.46, blue:0.13, alpha:1.00),
        .Symbol: UIColor(red:0.81, green:0.78, blue:0.62, alpha:1.00)
        
    ]
    
    init() {
        super.init(background: UIColor(red:0.16, green:0.19, blue:0.20, alpha:1.00), foreground: UIColor.white, textScheme: self.obsidian)
    }
    
}
