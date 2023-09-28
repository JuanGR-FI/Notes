//
//  CGColorExtension.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 23/09/23.
//

import Foundation
import UIKit

public extension CGColor {
    var UIColor : UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}
