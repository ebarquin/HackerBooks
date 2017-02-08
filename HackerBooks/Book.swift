//
//  Book.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 23/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit
import Foundation

typealias Author    = [String]
typealias Tag       = String
class Book {
    
    //MARK: - Stored properties
    let title       :   String
    let authors     :   Author
    let tags        :   [Tag]
    let image_url   :   URL
    let pdf_url     :   URL
    var isFavorite  :   Bool?
    
    
    //MARK: - Computed Properties
    
    //MARK: - Inicialization
    init(title:String,
         authors: Author,
         tags: [Tag],
         image_url: URL,
         pdf_url: URL,
        isFavorite:Bool?){
        
        self.title = title
        self.authors = authors
        self.tags = tags
        self.image_url = image_url
        self.pdf_url = pdf_url
        if isFavorite != nil{
            self.isFavorite = isFavorite
        }
        
        
    }
    //MARK: - Proxies
    
    func proxyForEquality() -> String {
        return "\(title)\(authors)\(tags)\(image_url)\(pdf_url)"
    }
    
    func proxyForComparison() -> String {
        return proxyForEquality()
    }
 
   

}

    //MARK: - Protocols

extension Book : Equatable {
    public static func == (lhs: Book, rhs: Book) -> Bool {
        return (lhs.proxyForEquality() == rhs.proxyForEquality())
    }
}


extension Book : Comparable {
    public static func <(lhs: Book, rhs: Book) -> Bool {
        return (lhs.proxyForComparison() < rhs.proxyForComparison())
    }
}

extension Book : Hashable {
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





