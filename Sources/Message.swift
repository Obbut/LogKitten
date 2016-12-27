import Foundation

public struct Message {
    
    internal init(level: Level, text: String, payload: Any? = nil, date: Date, source: String, origin: Origin) {
        self.level = level
        self.text = text
        self.payload = payload
        self.date = date
        self.source = source
        self.origin = origin
    }
    
    public typealias Origin = (function: String, filePath: String, line: Int, column: Int)
    
    public var level: Level
    public var text: String
    public var date: Date
    public var source: String
    public var origin: Origin
    public var payload: Any?
    
}
