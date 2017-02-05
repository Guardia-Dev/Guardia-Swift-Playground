//
//  Code.swift
//  Guardia
//
//  Created by 段昊宇 on 2017/2/5.
//
//

import Foundation
import Vapor
import Fluent

final class CodeFile: Model {
    var id: Node?
    var codeText: String
    var timestamp: String
    
    var path: String = {
        var path: String = "/Users/Shared/code.swift"
        return path
    }()
    
    init(code: String, timestamp: String) {
        self.id = UUID().uuidString.makeNode()
        self.codeText = code
        self.timestamp = timestamp
    }
    
    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        codeText = try node.extract("codeText")
        timestamp = try node.extract("timestamp")
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "codeText": codeText,
            "timestamp": timestamp,
        ])
    }
    
    // Operation Function
    public func creatFile() {
        let url: NSURL = NSURL(fileURLWithPath: self.path)
        let data = NSMutableData()
        data.append(codeText.data(using: String.Encoding.utf8, allowLossyConversion: true)!)
        data.write(toFile: url.path!, atomically: true)
    }
    
    public func runFile() {
        
    }
}

extension CodeFile {
    public convenience init?(from code: String, timestamp: String) throws {
        self.init(code: code, timestamp: timestamp)
    }
}

extension CodeFile: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }
    
    static func revert(_ database: Database) throws {
        //
    }
}
