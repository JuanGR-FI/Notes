//
//  AddNoteViewController.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    
    @IBOutlet var noteTitle: UITextView!
    
    @IBOutlet var noteContent: UITextView!
    
    
    @IBOutlet var fontFamilyControl: UIPickerView!
    @IBOutlet var fontColorControl: UIColorWell!
    
    var currentFontRGBAColor = [CGFloat(128.0/255), CGFloat(128.0/255), CGFloat(128.0/255), CGFloat(1.0)]
    var currentFontFamily = UIFont.familyNames.first
    var currentFontFamilyRow = 0
    var currentFontSize = 17.0
    
    let fontDataFamily = UIFont.familyNames.prefix(20)
    
    var newNote: Note?
    var noteIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fontFamilyControl.delegate = self
        fontFamilyControl.dataSource = self
        fontColorControl.addTarget(self, action: #selector(fontColorControlChanger), for: .valueChanged)
        prepareUI()
    }
    
    private func prepareUI() {
        if newNote != nil {
            noteTitle.text = newNote?.title
            noteContent.text = newNote?.content
            
            currentFontFamily = newNote?.fontFamily
            currentFontRGBAColor = newNote!.textColor
            currentFontFamilyRow = newNote!.fontFamilyRow
            
            noteTitle.font = UIFont(name: currentFontFamily!, size: currentFontSize)
            noteContent.font = UIFont(name: currentFontFamily!, size: currentFontSize)
            
            noteTitle.textColor = UIColor(red: currentFontRGBAColor[0], green: currentFontRGBAColor[1], blue: currentFontRGBAColor[2], alpha: currentFontRGBAColor[3])
            noteContent.textColor = UIColor(red: currentFontRGBAColor[0], green: currentFontRGBAColor[1], blue: currentFontRGBAColor[2], alpha: currentFontRGBAColor[3])
            
            fontFamilyControl.selectRow(currentFontFamilyRow, inComponent: 0, animated: true)
        }
    }
    
    @objc func fontColorControlChanger(){
        noteTitle.textColor = fontColorControl.selectedColor
        noteContent.textColor = fontColorControl.selectedColor
        currentFontRGBAColor = (fontColorControl.selectedColor?.cgColor.components)!

    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isModal = self.presentingViewController is UINavigationController
        //print("isModal: ",isModal)
        if isModal {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
        //self.dismiss(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        newNote = Note(title: noteTitle.text, content: noteContent.text, date: Date(), textColor: currentFontRGBAColor, fontFamily: currentFontFamily!, fontFamilyRow: currentFontFamilyRow)
        //Add validation Homework
        
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
        
        if noteIndex != nil {
            destination.index = noteIndex
        }
        
    }
    
    //Add validation Homework
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if !noteTitle.text.isEmpty && !noteContent.text.isEmpty {
            return true
        } else {
            print("Invalid form")
            return false
        }
        
    }
    

}
