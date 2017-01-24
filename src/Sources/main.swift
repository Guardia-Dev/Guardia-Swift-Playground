import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectMustache

// 创建HTTP服务器
let server = HTTPServer()

func Test() {
    
}

// 注册您自己的路由和请求／响应句柄
var routes = Routes()
routes.add(method: .get, uri: "/", handler: {
    request, response in
    let webRoot = request.documentRoot
    mustacheRequest(request: request, response: response, handler: Test() as! MustachePageHandler, templatePath: webRoot + "/Template/index.html")
})

routes.add(method: .get, uri: "/path/one", handler: { request, response in
    response.setBody(string: "路由句柄已经收到")
    response.completed()
})

// 将路由注册到服务器上
server.addRoutes(routes)

// 监听8181端口
server.serverPort = 8181

do {
    // 启动HTTP服务器
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("网络出现错误：\(err) \(msg)")
}

