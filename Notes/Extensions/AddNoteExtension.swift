//
//  NotesTableViewExtension.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 27/09/23.
//

import Foundation
import UIKit

//MARK: UIPickerViewDataSource methods implementation
extension AddNoteViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return appConstants.fontFamilyControlComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontDataFamily.count
    }
    
    
}

//MARK: UIPickerViewDelegate methods implementation
extension AddNoteViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontDataFamily[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected row:", row)
        currentFontFamily = fontDataFamily[row]
        currentFontFamilyRow = row
        noteTitle.font = UIFont(name: currentFontFamily!, size: currentFontSize)
        noteContent.font = UIFont(name: currentFontFamily!, size: currentFontSize)
        
        
    }
    
}
