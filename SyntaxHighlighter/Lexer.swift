//
//  Lexer.swift
//  SyntaxHighlighter
//
//  Created by Joel Cummings on 2017-06-18.
//  Copyright © 2017 Joel Cummings. All rights reserved.
//

import Foundation

class Lexer {
    
    enum Modes {
        case Read
        case Chomp
    }
    
    let parenthesis = ["(", "{", "}", ")", "[", "]"]
    
    let longCapture: [TokenType: [(String, String)]]
    let tokens: [TokenType: [String]]
    let content: String
    var index: String.Index
    var lastChar: Character?
    var startIndex: String.Index
    var intStartIndex: Int = 0
    var intEndIndex: Int = 0
    
    var currentChar: Character? {
        return index < content.endIndex ? content[index] : nil
    }
    
    init(tokens: [TokenType: [String]],  longCapture: [TokenType: [(String, String)]], content: String) {
        self.tokens = tokens
        self.longCapture = longCapture
        self.content = content
        self.index = self.content.startIndex
        self.startIndex = self.content.startIndex
        
    }
    
    /**
     Push the index to the next character
     */
    func advanceIndex() {
        if self.index < content.endIndex {
            content.characters.formIndex(after: &index)
            self.intEndIndex += 1
        }
    }
    
    /**
     Identifiers represent alphanumeric strings without spaces
     */
    func readIdentifier() -> String {
        var str = ""
        
        while let char = currentChar, char.isAlphaNumeric {
            str.characters.append(char)
            advanceIndex()
        }
        return str
    }
    
    /**
     Reads a string of one or more symbols such as punctuation
     */
    func readSymbols() -> String {
        var str = ""
        
        while let char = currentChar, char.isSymbol {
            str.characters.append(char)
            advanceIndex()
        }
        return str
    }
    
    /**
     Chomps the input until it finds its finishing point
     */
    func chomp(until: String) -> String {
        var str = ""
        while true {
            if let char = currentChar {
                str.characters.append(char)
                if str.contains(until) {
                    break
                }
                advanceIndex()
            } else { break }
        }
        return str
    }
    
    /**
     Creates a Token Object
     */
    func emitToken(str: String, type: TokenType, advance: Bool = true) -> TokenStruct {
        let t = TokenStruct(value: str, pos: NSMakeRange(self.intStartIndex, str.characters.count), token: type)
        return t
    }
    
    func tokenize() -> TokenStruct? {
        while let char = currentChar, char.isSpace {
            advanceIndex()
        }
        
        guard let char = currentChar else {
            return nil
        }
        // Reset the beginning to where we last ended (one character after the last read)
        self.intStartIndex = self.intEndIndex
        
        if parenthesis.contains(String(char)) {
            advanceIndex()
            return emitToken(str: String(char), type: .Parens)
        }
        
        // Check for numbers
        if char.isNumeric {
            advanceIndex()
            return emitToken(str: String(char), type: .Numeric)
        }
        
        // Read String
        let identifier = readIdentifier()
        
        for (tokenT, list) in self.tokens {
            if list.contains(identifier) {
                return emitToken(str: identifier, type: tokenT)
            }
        }
        
        if char.isSymbol {
            let symbols = readSymbols()
            // Check for comments or Strings
            for (tokenT, list) in self.longCapture {
                for (start, end) in list {
                    if symbols.contains(start) {
                        let result = symbols + chomp(until: end)
                        advanceIndex() // We have chomped but must advance after the chomp
                        return emitToken(str: result, type: tokenT)
                    }
                }
            }
            return emitToken(str: String(char), type: .Symbol)
        }
        
        return emitToken(str: identifier, type: .Other)
    }
    
    func lex() -> [TokenStruct] {
        var toks = [TokenStruct]()
        while let tok = tokenize() {
            toks.append(tok)
        }
        return toks
    }
    
}
