//
//  Tag.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 8/2/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

class Tag {
    
    //MARK: - Stored properties
    let tag : String
    
    //MARK: - Initialization
    init(tag: String){
        self.tag = tag
    }
    
    //MARK: - Proxies
    
    func proxyForEquality() -> String {
        return "\(tag)"
    }
    
    func proxyForComparison() -> String {
        return proxyForEquality()
    }
    
}
//MARK: - Protocols

extension Tag : Equatable {
    public static func == (lhs: Tag, rhs: Tag) -> Bool {
        return (lhs.proxyForEquality() == rhs.proxyForEquality())
    }
}


extension Tag : Comparable {
    public static func <(lhs: Tag, rhs: Tag) -> Bool {
        return (lhs.proxyForComparison() < rhs.proxyForComparison())
    }
}

extension Tag : Hashable {
    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        get {
            return proxyForEquality().hashValue
        }
    }

}
