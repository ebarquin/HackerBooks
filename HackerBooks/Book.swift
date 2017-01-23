//
//  Book.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 23/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit
import Foundation

class Book {
    
    //MARK: - Stored properties
    let title   :   String
    let author  :   String
    let tags    :   String
    let image   :   UIImage
    let pdf     :   Data
    
    
    //MARK: - Computed Properties
    
    //MARK: - Inicialization
    init(title:String,
         author: String,
         tags: String,
         image: UIImage,
         pdf: Data){
        
        self.title = title
        self.author = author
        self.tags = tags
        self.image = image
        self.pdf = pdf
    }
    //MARK: - Proxies
    
    func proxyForEquality() -> String {
        return "\(title)\(author)\(tags)\(image.hash)\(pdf.hashValue)"
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







