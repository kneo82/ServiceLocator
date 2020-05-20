//
//  File.swift
//  
//
//  Created by Vitaliy Voronok on 20.05.2020.
//

import Foundation

@propertyWrapper
struct Inject<T>{
    
    var component: T?
    
    init(){
        self.component = ServiceLocator.shared.getServiceOf(T.self)
    }
    
    public var wrappedValue: T? {
        get { return component}
        mutating set { component = newValue }
    }
    
}
