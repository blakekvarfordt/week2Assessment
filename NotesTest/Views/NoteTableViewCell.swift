//
//  NoteTableViewCell.swift
//  NotesTest
//
//  Created by Blake kvarfordt on 8/9/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit


protocol NoteTableViewCellDelegate {
    func noteTapped(_ sender: NoteTableViewCell)
}

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    var delegate: NoteTableViewCellDelegate?
    
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        delegate?.noteTapped(self)
    }
    
    
}

extension NoteTableViewCell {
    func update(note: Note) {
        cellTitleLabel.text = note.title
        if !note.isComplete {
            isCompleteButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            isCompleteButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}
