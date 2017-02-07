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
    print(codefile.pwd())
    let retLog: String = codefile.runFile()
    
    return try JSON(node: [
        "result": "success",
        "data": retLog,
        ])
}

drop.post("release-log") { request in
    guard let rellog = request.data["log"]?.string else {
        throw Abort.badRequest
    }
    
    return try JSON(node: [
        "result": "success",
        "data": rellog,
        ])
}

drop.resource("posts", PostController())

drop.run()

