//
//  Logger.swift
//  LogKitten
//
//  Created by Robbert Brandsma on 08-08-16.
//
//

import Foundation

public class Logger : _Logger {
    public init() {
        if Logger.componentLogger == nil {
            self.useForComponents = true
        }
    }
    
    public func log(_ message: Message) {
        for destination in destinations {
            destination.log(message)
        }
    }
    
    fileprivate static weak var componentLogger: Logger? = nil
    
    public var componentIdentifier: String = "main"
    
    public var destinations: [Destination] = [ConsoleDestination()]
    
    public var useForComponents: Bool {
        get {
            return self === Logger.componentLogger
        }
        set {
            if newValue {
                Logger.componentLogger = self
            } else if Logger.componentLogger === self {
                Logger.componentLogger = nil
            }
        }
    }
    
    public class func logger(forComponent identifier: String) -> _Logger {
        return ComponentLogProxy(identifier: identifier)
    }
}

public class ComponentLogProxy : _Logger {
    public let componentIdentifier: String
    
    fileprivate init(identifier: String) {
        self.componentIdentifier = identifier
    }
    
    public func log(_ message: Message) {
        // If the component logger is already set, log this message
        if let log = Logger.componentLogger {
            log.log(message)
        }
    }
}

