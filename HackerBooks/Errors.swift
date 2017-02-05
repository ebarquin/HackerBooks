//
//  Errors.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 29/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

enum BookErrors: Error {
    case nilJSONObject
    case wrongURLFormatForJSONSource
    case resourcePointedByURLNotReachable
    case wrongJSONFormat
    case JSONParsingError
    case filePointedByURLNotReachable
    case CellNil
    
}
