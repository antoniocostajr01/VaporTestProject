//
//  CreateSongs.swift
//  VaporTestProject
//
//  Created by Antonio Costa on 16/10/25.
//

import Foundation
import Fluent

struct CreateSongs: Migration{
    
    //As mudanças que eu quero fazer. Usado também para criar as tabelas que eu quero usar
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs") //Nome da tabela
            .id()
            .field("title", .string, .required)
            .create()
    }
    
    
    //As mudanças q eu quero refazer
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("songs").delete()
    }
}
