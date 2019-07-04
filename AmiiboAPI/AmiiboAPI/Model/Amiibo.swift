//
//  Amiibo.swift
//  AmiiboAPI
//
//  Created by Álvaro Ávalos Hernández on 7/3/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import Foundation


struct Amiibo: Decodable {
    let name: String
    let image: String
    let amiiboSeries: String
    //let release: Release?
}

// MARK: - Release
struct Release: Decodable {
    let au, eu, jp, na: String
}

