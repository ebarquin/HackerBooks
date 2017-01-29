//
//  JSONProcesssing.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 29/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation
import UIKit

/*
 {
 "authors": "Scott Chacon, Ben Straub",
 "image_url": "http://hackershelf.com/media/cache/b4/24/b42409de128aa7f1c9abbbfa549914de.jpg",
 "pdf_url": "https://progit2.s3.amazonaws.com/en/2015-03-06-439c2/progit-en.376.pdf",
 "tags": "version control, git",
 "title": "Pro Git"
 }
 */

//MARK: - Aliases
typealias JSONObject = AnyObject
typealias JSONDictionary = [String: JSONObject]
typealias JSONArray = [JSONDictionary]

//MARK: - Decodification

func decode(Book json: JSONDictionary) throws -> Book {
    
    //Validamos el diccionario
    
    guard let authorsString = json["authors"] as? String else {
        throw BookErrors.nilJSONObject
    }
    
    guard let imageURLString = json["image_url"] as? String,
        let image_url = URL(string: imageURLString) else {
            throw BookErrors.resourcePointedByURLNotReachable
    }
    
    guard let pdfURLString = json["pdf_url"] as? String,
        let pdf_url = URL(string: pdfURLString) else {
            throw BookErrors.resourcePointedByURLNotReachable
    }
    
    guard let tagsString = json["tags"] as? String else {
        throw BookErrors.nilJSONObject
    }
    
    guard let title = json["title"] as? String else {
        throw BookErrors.nilJSONObject
    }
    
    let authors = authorsString.components(separatedBy: ", ")
    let tags = tagsString.components(separatedBy: ", ")
    
    return Book(title: title, authors: authors, tags: tags, image_url: image_url, pdf_url: pdf_url)

    
}

func decode(Book json: JSONDictionary?) throws -> Book {
    guard let json = json else {
        throw BookErrors.nilJSONObject
    }
    return try decode(Book: json)
}
