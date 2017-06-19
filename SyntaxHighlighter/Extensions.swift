//
//  Extensions.swift
//  SyntaxHighlighter
//
//  Created by Joel Cummings on 2017-06-18.
//  Copyright © 2017 Joel Cummings. All rights reserved.
//

import Foundation

extension Character {
    var value: Int32 {
        return Int32(String(self).unicodeScalars.first!.value)
    }
    
    var isSymbol: Bool {
        return ispunct(value) != 0 && isnumber(value) == 0
    }
    
    var isAlphaNumeric: Bool {
        return isalnum(value) != 0 || self == "_"
    }
    
    var isNumeric: Bool {
        return isnumber(value) != 0
    }
    
    var isSpace: Bool {
        return isspace(value) != 0
    }
}
