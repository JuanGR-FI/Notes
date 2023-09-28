//
//  NoteManager.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 22/09/23.
//

import Foundation

class NoteManager {
    
    private var notes : [Note] = []
    
    func createNote(note: Note) {
        notes.append(note)
    }
    
    func deleteNote(index: Int) {
        notes.remove(at: index)
    }
    
    func countNotes() -> Int {
        return notes.count
    }
    
    func getNote(index: Int) -> Note {
        return notes[index]
    }
    
    func getNotes() -> [Note] {
        return notes
    }
    
    /*func loadNotes(){
        //Load notes from filesystem
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let notesPath = documentDirectory.appendingPathComponent("notes.json")
        
        //Check if file exists
        if fileManager.fileExists(atPath: notesPath.absoluteString) {
            do {
                let jsonData = fileManager.contents(atPath: notesPath.absoluteString)
                print("json: ", jsonData)
                notes = try JSONDecoder().decode([Note].self, from: jsonData!)
                print("notes: ", notes)
            }catch let error {
                print(error)
            }
        }else {
            print("MSG: File does not exists")
        }
        
    }
    
    func saveNotes() {
        //saves notes to filesystem
        
        //set directory for saving json file
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let notesPath = documentDirectory.appendingPathComponent("notes.json")
        print(notesPath)
        
        //Adding note to json file
        do{
            let jsonData = try JSONEncoder().encode(notes)
            print("path", notesPath.absoluteString)
            fileManager.createFile(atPath: notesPath.absoluteString, contents: jsonData)
        }catch let error {
            print(error)
        }
        
    }*/
    
    func getFilePath() -> URL{
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let noteUrlPath = documentDirectory.appendingPathComponent("notes.json")
        
        return URL(string: noteUrlPath.absoluteString)!
    }
    
    func loadNotes(){
        let notesPath = getFilePath()
        
        let fileManager = FileManager.default
        
        if(fileManager.fileExists(atPath: notesPath.path)){
            
            do{
                let jsonData = fileManager.contents(atPath: notesPath.path)
                
                notes = try JSONDecoder().decode([Note].self, from: jsonData!)
                
            }catch let error{
                print(error)
            }
        }else{
            // File doesn't exist
        }
        
        
    }
        
    func saveNotes(){
        let fileManager = FileManager.default
        
        do{
            let jsonData = try JSONEncoder().encode(notes)
            fileManager.createFile(atPath: getFilePath().path, contents: jsonData)
            
        }catch let error{
            print(error)
        }
    }
    
    func updateNote(note: Note, index: Int) {
        //Update a note at specified index
        notes[index] = note
    }
    
}
