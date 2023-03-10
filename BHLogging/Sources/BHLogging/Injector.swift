//
//  Injector.swift
//  
//
//  Created by Oanea, George on 15.02.2023.
//

import Resolver

public enum Injector {

    public static func inject() {
        Resolver.register { RealAppLogger() as AppLogger }
    }
}
