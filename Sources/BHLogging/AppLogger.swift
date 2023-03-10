//
//  AppLogger.swift
//  
//
//  Created by Oanea, George on 15.02.2023.
//

import OSLog

/// An interface to the unified logging system for the application.
public protocol AppLogger {

    /// Log messaged only to console, without notifying diagnose tools.
    /// Use `isPrivate` flag for redacting items.
    func consoleLog(_ message: String, items: Any..., isPrivate: Bool, level: OSLogType, file: String, function: String, line: Int)

    /// Log messages to a certain log level.
    func log(_ message: String, level: OSLogType, file: String, function: String, line: Int)

    /// Log messages on the `debug` level into the console.
    ///
    /// Use this method only for debugging events. For example when you need detailed information on whats happening during an event.
    ///
    /// - Note: All messages are only saved in-memory and will not be send to the integrated diagnose and crash analytics tool or saved on device.
    func debug(_ message: String, file: String, function: String, line: Int)

    /// Log messages on the `info` level into the console.
    ///
    /// Use this method for general information provisioning of events. For example use info when you want to check a stream of events to see what happening in which order.
    ///
    /// - Note: The message will be send to the integrated diagnose and crash analytics tool, but are not saved on device.
    func info(_ message: String, file: String, function: String, line: Int)

    /// Log messages on the `warning` level into the console.
    ///
    /// Use this method to provide a warning that in our code is something happening that can result into errors.
    ///
    /// - Note: The message will be send to the integrated diagnose and crash analytics tool.
    func warning(_ message: String, file: String, function: String, line: Int)

    /// Log messages on the `error` level into the console.
    ///
    /// Use this method to provide a message that an error occured during the execution of our code.
    ///
    /// - Note: The message will be send to the integrated diagnose and crash analytics tool.
    func error(_ message: String, file: String, function: String, line: Int)

    /// Log messages on the `fault` level into the console.
    ///
    /// Use this method to provide a message that an error occured during the execution of system-level or third-party code.
    ///
    /// - Note: The message will be send to the integrated diagnose and crash analytics tool.
    func fault(_ message: String, file: String, function: String, line: Int)
}

extension AppLogger {

    public func consoleLog(_ message: String, items: Any..., isPrivate: Bool = true, level: OSLogType = .info, file: String = #fileID, function: String = #function, line: Int = #line) {
        consoleLog(message, items: items, isPrivate: isPrivate, level: level, file: file, function: function, line: line)
    }

    public func log(_ message: String, level: OSLogType = .info, file: String = #fileID, function: String = #function, line: Int = #line) {
        log(message, level: level, file: file, function: function, line: line)
    }

    public func debug(_ message: String, file: String = #fileID, function: String = #function, line: Int = #line) {
        debug(message, file: file, function: function, line: line)
    }

    public func info(_ message: String, file: String = #fileID, function: String = #function, line: Int = #line) {
        info(message, file: file, function: function, line: line)
    }

    public func warning(_ message: String, file: String = #fileID, function: String = #function, line: Int = #line) {
        warning(message, file: file, function: function, line: line)
    }

    public func error(_ message: String, file: String = #fileID, function: String = #function, line: Int = #line) {
        error(message, file: file, function: function, line: line)
    }

    public func fault(_ message: String, file: String = #fileID, function: String = #function, line: Int = #line) {
        fault(message, file: file, function: function, line: line)
    }
}
