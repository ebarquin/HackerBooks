//
//  FoundationExtensions.swift
//  HackerBooks
//
//  Created by Eugenio Barquín on 30/1/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import Foundation

extension Bundle {
    func url(forResource name: String) -> URL?{
        let tokens = name.components(separatedBy: ".")
        return self.url(forResource: tokens[0], withExtension: tokens[1])
        
    }
}
