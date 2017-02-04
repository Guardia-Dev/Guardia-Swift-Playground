//
//  Code.swift
//  Guardia
//
//  Created by Desgard_Duan on 2017/2/4.
//
//

import Foundation

final class Code {
    var codeText: String
    var pathURL: String
    var fileName: String
    var timestamp: Int?
    
    init(codeText: String, pathURL: String, fileName: String) {
        self.codeText = codeText
        self.pathURL = pathURL
        self.fileName = fileName
    }
    
    public func creatCodeFile() {
        
    }
    
    public func runCodeFile() -> String {
        let ret: String = ""
        return ret
    }
    
    public func delCodeFile() {
        
    }
    
}
