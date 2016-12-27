//
//  Convenience.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

extension _Logger {
    public func log(level: Level, text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        let message = Message(level: level, text: text, payload: payload, date: Date(), source: self.componentIdentifier, origin: (function, file, line, column))
        self.log(message)
    }
    
    public func verbose(_ text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .verbose, text: text, payload: payload, function, file, line, column)
    }
    
    public func debug(_ text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .debug, text: text, payload: payload, function, file, line, column)
    }
    
    public func info(_ text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .info, text: text, payload: payload, function, file, line, column)
    }
    
    public func success(_ text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .success, text: text, payload: payload, function, file, line, column)
    }
    
    public func warning(_ text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .warning, text: text, payload: payload, function, file, line, column)
    }
    
    public func error(_ text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .error, text: text, payload: payload, function, file, line, column)
    }
    
    public func fatal(_ text: String, payload: Any? = nil, _ function: String = #function, _ file: String = #file, _ line: Int = #line, _ column: Int = #column) {
        self.log(level: .fatal, text: text, payload: payload, function, file, line, column)
    }
}
