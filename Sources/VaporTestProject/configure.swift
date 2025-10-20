import NIOSSL
import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
 
    if let databaseURL = Environment.get("DATABASE_URL") {
            try app.databases.use(.postgres(url: databaseURL), as: .psql)
        } else {
            app.logger.warning("DATABASE_URL not set. Using default local configuration.")
            app.databases.use(.postgres(
                hostname: Environment.get("DATABASE_HOST") ?? "localhost",
                username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
                password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
                database: Environment.get("DATABASE_NAME") ?? "vapor_database"
            ), as: .psql)
        }
    
    app.migrations.add(CreateSongs())
    
    // register routes
    try routes(app)
}
