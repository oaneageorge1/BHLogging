//
//  RealAppLogger.swift
//  
//
//  Created by Oanea, George on 15.02.2023.
//

import OSLog

struct RealAppLogger {

    // MARK: - Properties

    private var unifiedLogger: Logger = UnifiedLoggerFactory.createApplicationLogger()
}

// MARK: - AppLogger

extension RealAppLogger: AppLogger {

    func consoleLog(_ message: String, items: Any..., isPrivate: Bool, level: OSLogType, file: String, function: String, line: Int) {
        if isPrivate {
            unifiedLogger.log(level: level, "\(buildMessage(from: message, file: file, function: function, line: line))\(items, privacy: .private)")
        } else {
            unifiedLogger.log(level: level, "\(buildMessage(from: message, file: file, function: function, line: line))\(items, privacy: .public)")
        }
    }

    func log(_ message: String, level: OSLogType, file: String, function: String, line: Int) {
        logUnified(
            on: level,
            message: buildMessage(from: message, file: file, function: function, line: line)
        )
    }

    func debug(_ message: String, file: String, function: String, line: Int) {
        logUnified(
            on: .debug,
            message: buildMessage(from: message, file: file, function: function, line: line)
        )
    }

    func info(_ message: String, file: String, function: String, line: Int) {
        logUnified(
            on: .info,
            message: buildMessage(from: message, file: file, function: function, line: line)
        )
    }

    func warning(_ message: String, file: String, function: String, line: Int) {
        logUnified(
            on: .default,
            message: buildMessage(from: message, file: file, function: function, line: line)
        )
    }

    func error(_ message: String, file: String, function: String, line: Int) {
        logUnified(
            on: .error,
            message: buildMessage(from: message, file: file, function: function, line: line)
        )
    }

    func fault(_ message: String, file: String, function: String, line: Int) {
        logUnified(
            on: .fault,
            message: buildMessage(from: message, file: file, function: function, line: line)
        )
    }
}

// MARK: - Private

private extension RealAppLogger {

    func logUnified(on level: OSLogType, message: String) {
        let logLevelPrefix = buildLogLevelPrefix(from: level)
        let prefixedMessage = "\(logLevelPrefix) \(message)"

        unifiedLogger.log(level: level, "\(prefixedMessage)")
    }

    func buildLogLevelPrefix(from level: OSLogType) -> String {
        switch level {
        case .debug: return "[🛠️]"
        case .info: return "[ℹ️]"
        case .default: return "[⚠️]"
        case .error: return "[🛑]"
        case .fault: return "[💥]"
        default: return "[Default]"
        }
    }

    func buildCallLocationPrefix(file: String, function: String, line: Int) -> String {
        "[\(file) | \(function) + \(line)]"
    }

    func buildMessage(from message: String, file: String, function: String, line: Int) -> String {
        "\(buildCallLocationPrefix(file: file, function: function, line: line)) \(message)"
    }
}
