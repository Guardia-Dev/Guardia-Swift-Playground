import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

let server = HTTPServer()

server.documentRoot = "./Template"

var routes = Routes()

routes.add(method: .get, uri: "/", handler: {
    request, response in
    
    response.setHeader(.contentType, value: "text/html")
    mustacheRequest(
        request: request,
        response: response,
        handler: ListHandler(),
        templatePath: request.documentRoot + "/index.mustache"
    )
    response.completed()
})

// 将路由注册到服务器上
server.addRoutes(routes)

// 监听8181端口
server.serverPort = 8282

do {
    // 启动HTTP服务器
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("网络出现错误：\(err) \(msg)")
}

