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

let DEFAULT_RUN_PATH: String = "/Users/Shared/Guardia-pg/code.swift"
let DEFALUT_LOG_PATH: String = "/Users/Shared/Guardia-pg/code.log"

final class CodeFile: Model {
    var id: Node?
    var codeText: String
    var timestamp: String
    
    let path: String = {
        var path: String = DEFAULT_RUN_PATH
        return path
    }()
    
    let logPath: String = {
        var path: String = DEFALUT_LOG_PATH
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
    private func cli(cmd: String) -> String {
        let process: Process = Process()
        process.launchPath = "/bin/bash"
        process.arguments = ["-c", cmd]
        
        let pipe: Pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe
        
        let fileHandle: FileHandle = pipe.fileHandleForReading
        process.launch()
        
        let data: Data = fileHandle.readDataToEndOfFile()
        let log: String = String(data: data, encoding: String.Encoding.utf8)!
        
        return log
    }
    
    private func isFileExist(atPath filePath: String) -> Bool {
        return FileManager.default.fileExists(atPath: filePath)
    }
    
    public func creatFile() {
        let url: NSURL = NSURL(fileURLWithPath: self.path)
        let data = NSMutableData()
        data.append(codeText.data(using: String.Encoding.utf8, allowLossyConversion: true)!)
        data.write(toFile: url.path!, atomically: true)
    }
    
    public func readLogFile() -> String {
        let file: URL = URL(fileURLWithPath: self.logPath)
        let readHandler = try! FileHandle(forReadingFrom: file)
        let data: Data = readHandler.readDataToEndOfFile()
        let log: String = String(data: data, encoding: String.Encoding.utf8)!
        return log
    }
    
    
    public func runFile() -> String {
        let serverLog: String = cli(cmd: "bash run-swift.sh;")
        let retLog: String = readLogFile()
        print(serverLog)
        return retLog
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
