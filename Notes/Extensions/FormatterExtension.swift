//
//  FormatterExtension.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 23/09/23.
//

import Foundation

import Foundation

public extension Formatter {
    static let iso8601withFractionalSeconds: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = .autoupdatingCurrent
        //        formatter.locale = Locale(identifier: "es_MX")
        formatter.timeZone = .autoupdatingCurrent
        //        formatter.timeZone = TimeZone(identifier: "America/Mexico_City")

        formatter.dateFormat = "dd/MM/yyyy' 'HH:mm:ss"
        
//        formatter.dateFormat = "dd/MM/yyyy'T'HH:mm:ss.SSSZZZZZ"
        return formatter
    }()
}
