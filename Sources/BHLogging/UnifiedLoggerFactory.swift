//
//  UnifiedLoggerFactory.swift
//  
//
//  Created by Oanea, George on 15.02.2023.
//

import OSLog

enum UnifiedLoggerFactory {

    static func createApplicationLogger() -> Logger {
        Logger(
            subsystem: Bundle.main.bundleIdentifier ?? "com.bh.logging",
            category: "Application"
        )
    }
}
