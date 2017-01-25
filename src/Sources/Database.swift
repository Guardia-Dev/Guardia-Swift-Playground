//
//  Database.swift
//  Guardia-Swift
//
//  Created by Desgard_Duan on 2017/1/25.
//
//

import Foundation
import PerfectLib
import SQLite
import PerfectHTTP
import SwiftString

class Database {
    let dbPath = "./db.sqlite3"

    func createPost() {
        do {
            let sqlite = try SQLite(dbPath)
            defer {
                sqlite.close()
            }
            try sqlite.execute(
                statement: "CREATE TABLE IF NOT EXISTS post (id INTEGER PRIMARY KEY NOT NULL, title TEXT NOT NULL, titlesanitized TEXT NOT NULL, synopsis TEXT NOT NULL, body TEXT NOT NULL, author TEXT NOT NULL, date DATETIME NOT NULL)"
            )
        } catch {
            print(error)
        }
    }
}
