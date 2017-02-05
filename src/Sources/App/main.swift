import Vapor
import Foundation

let drop = Droplet()

drop.get{ req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("index") { request in
    return try drop.view.make("index", [
        
    ])
}

drop.post("post") { request in
    guard let codeText = request.data["codeText"]?.string else {
        throw Abort.badRequest
    }
    guard let timestamp = request.data["timestamp"]?.string else {
        throw Abort.badRequest
    }
    
    var codefile: CodeFile = CodeFile(code: codeText, timestamp: timestamp)
    codefile.creatFile()
    
    return try JSON(node: ["result": "success"])
}

drop.resource("posts", PostController())

drop.run()

