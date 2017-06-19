//
//  CLike.swift
//  SyntaxHighlighter
//
//  Created by Joel Cummings on 2017-06-18.
//  Copyright © 2017 Joel Cummings. All rights reserved.
//

import Foundation

class CLike: Lexer {
    
    let cTok: [TokenType: [String]] = [
        .Keyword : ["bool","int","long","float","short","double","char","string","object","void","mapping",
                    "array","multiset","program","function","lambda","mixed"],
        .Word: ["catch", "new", "private", "protected", "public", "gauge",
                "throw", "throws", "class", "interface", "implement", "abstract", "extends", "from",
                "this", "super", "new", "constant", "final", "static", "import", "use", "extern",
                "inline", "proto", "break", "continue", "if", "else", "for",
                "while", "do", "switch", "case", "as", "in", "version", "return", "true", "false", "null",
                "__VERSION__", "__MAJOR__", "__MINOR__", "__BUILD__", "__REAL_VERSION__",
                "__REAL_MAJOR__", "__REAL_MINOR__", "__REAL_BUILD__", "__DATE__", "__TIME__",
                "__FILE__", "__DIR__", "__LINE__", "__AUTO_BIGNUM__", "__NT__", "__PIKE__",
                "__amigaos__", "_Pragma", "static_assert", "defined", "sscanf"],
        ]
    
    let cCap: [TokenType: [(String, String)]] = [
        .String : [("\"", "\""), ("'", "'")],
        .Comment: [("/*", "*/"), ("//", "\n")]
    ]
    
    init(content: String) {
        super.init(tokens: self.cTok, longCapture: self.cCap, content: content)
    }
    
}
