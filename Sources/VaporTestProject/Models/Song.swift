//
//  Song.swift
//  VaporTestProject
//
//  Created by Antonio Costa on 16/10/25.
//

import Fluent
import Vapor


//Essa classe representa a tabela "songs"
final class Song: Model, Content, @unchecked Sendable {
    static let schema = "songs"
        
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    init() {}
    
    init(id: UUID? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
