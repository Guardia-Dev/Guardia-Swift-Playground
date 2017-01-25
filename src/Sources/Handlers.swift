//
//  Handlers.swift
//  Guardia-Swift
//
//  Created by Desgard_Duan on 2017/1/25.
//
//

import PerfectLib
import SQLite
import PerfectHTTP
import PerfectMustache
import SwiftString

struct ListHandler: MustachePageHandler {
    func extendValuesForResponse(context contxt: MustacheWebEvaluationContext, collector: MustacheEvaluationOutputCollector) {
        var values = MustacheEvaluationContext.MapType()
        var array = [Any]()
        
        for _ in 0 ..< 1 {
            var thisPost = [String: String]()
            thisPost["title"] = "title"
            thisPost["synopsis"] = "synopsis"
            array.append(thisPost)
        }
        values["posts"] = array
        
        contxt.extendValues(with: values)
        do {
            try contxt.requestCompleted(withCollector: collector)
        } catch {
            let response = contxt.webResponse
            response.status = .internalServerError
            response.appendBody(string: "\(error)")
            response.completed()
        }
    }
}
