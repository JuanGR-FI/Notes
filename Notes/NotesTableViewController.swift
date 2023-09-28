//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Juan Andrés Cervantes Guati Rojo on 22/09/23.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    @IBOutlet var tableViewNotes: UITableView!
    @IBOutlet var emptyNoteView: UIView!
    let noteManager = NoteManager()
    
    var note: Note? = nil
    var index: Int? = nil
    
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteManager.loadNotes()
        notes = noteManager.getNotes()
        
        reloadUI()
        
    }
    
    func reloadUI() {
        if noteManager.countNotes() == 0 {
            emptyNoteView.isHidden = false
            tableViewNotes.backgroundView = emptyNoteView
        }else {
            emptyNoteView.isHidden = true
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteManager.countNotes()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        
        //let notes = noteManager.getNotes()
        
        cell.titleLabel.text = notes[indexPath.row].title
        cell.dateLabel.text = notes[indexPath.row].date.iso8601String
        
        cell.titleLabel.font = UIFont(name: notes[indexPath.row].fontFamily, size: appConstants.defaultFontSize)
        cell.dateLabel.font = UIFont(name: notes[indexPath.row].fontFamily, size: appConstants.defaultFontSize)
        
        cell.titleLabel.textColor = UIColor(red: notes[indexPath.row].textColor[0],
                                            green: notes[indexPath.row].textColor[1],
                                            blue: notes[indexPath.row].textColor[2],
                                            alpha: notes[indexPath.row].textColor[3])
        
        cell.dateLabel.textColor = UIColor(red: notes[indexPath.row].textColor[0],
                                            green: notes[indexPath.row].textColor[1],
                                            blue: notes[indexPath.row].textColor[2],
                                            alpha: notes[indexPath.row].textColor[3])
        

        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        note = noteManager.getNote(index: indexPath.row)
        index = indexPath.row
        performSegue(withIdentifier: "editTaskSegue", sender: self)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            noteManager.deleteNote(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveChanges()
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "editTaskSegue" {
            let destination = segue.destination as! AddNoteViewController
            destination.newNote = note
            destination.noteIndex = index
        }
        
        //print("Bye")
    }
    
    @IBAction func unWindFromAddNoteViewController(segue: UIStoryboardSegue){
        //print("Unwind segue")
        let source = segue.source as! AddNoteViewController
        note = source.newNote
        index = source.noteIndex
        
        if index != nil { //Updating note
            noteManager.updateNote(note: note!, index: index!)
        }else{ //Creating note
            noteManager.createNote(note: note!)
            //print("#", noteManager.countNotes())
            //print("", noteManager.getNotes())
        }
        
        //Saving and reloading data
        saveChanges()
        
    }
    
    func saveChanges() {
        noteManager.saveNotes()
        notes = noteManager.getNotes()
        reloadUI()
        tableViewNotes.reloadData()
    }

}
