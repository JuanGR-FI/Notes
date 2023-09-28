//
//  Note.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 22/09/23.
//

import Foundation

struct Note : Codable {
    var title: String
    var content: String
    var date: Date
    var textColor: [CGFloat]
    var fontFamily: String
    var fontFamilyRow: Int
}
