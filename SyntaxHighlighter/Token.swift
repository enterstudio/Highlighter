//
//  Token.swift
//  SyntaxHighlighter
//
//  Created by Joel Cummings on 2017-06-18.
//  Copyright © 2017 Joel Cummings. All rights reserved.
//

import Foundation

enum TokenType {
    case Numeric
    case String
    case Comment
    case Word
    case Keyword
    case TypeDeclaration
    case Parens
    case Other
    case Symbol
}

    struct TokenStruct: CustomStringConvertible {
        let value: String
        var pos: NSRange
        let token: TokenType
        
        var description: String {
            return "{value: \(self.value) " +
               // "pos: \(self.pos)" +
            " token: \(self.token)}"
        }
    }
