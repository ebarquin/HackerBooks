//
//  Library.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 31/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
import UIKit

//Representa un conjunto de libros
class Library {
    
    //MARK: - Properties
    var books = MultiDictionary<Tag, Book>()
    
    
    
    //MARK: - Computed Properties
    //Devuelve el número total de libros
    var booksCount: Int{
        get{
            let count: Int = self.books.count
            return count
        }
    }
    
    //MARK: - Inizialization
    init (books: [Book]){
        for book in books {
            for tag in book.tags {
                self.books.insert(value: book, forKey: tag)
                
            }
        }
    }
    
    //MARK: - Accesors
    
    //Returns tags array
    var tags: [Tag] {
        get {
            var tags: [Tag] = []
            for tag in books.keys.sorted(){
                tags.append(tag)
            }
            return tags
        }
    }

    //Returns number of tags
    var tagsCount : Int {
        get{
            return books.keys.count
        }
    }
    
    //Returns number of book for tag
    func bookCount(forTagName name: Tag) -> Int {
        guard let count = books[name]?.count else {
            return 0
        }
        return count
    }
    
    //Returns a book at index
    func book(atIndex index: Int, forTag tag: Tag) -> Book?{
        guard let bookCollection = books[tag] else {
            return nil
        }
        return bookCollection.sorted()[index]

    }
    
    
}
