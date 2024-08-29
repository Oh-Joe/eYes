//
//  AddNoteView.swift
//  eYes
//
//  Created by Antoine Moreau on 8/29/24.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) var dismiss
    @State private var noteTitle: String
    @State private var noteContent: String
    @State private var noteDate: Date
    var contact: Contact
    var onSave: ((Contact.Note) -> Void)?
    var existingNote: Contact.Note?
    
    var isFormValid: Bool {
        !noteTitle.isEmpty && !noteContent.isEmpty
    }
    
    init(note: Contact.Note? = nil, contact: Contact, onSave: ((Contact.Note) -> Void)? = nil) {
        _noteTitle = State(initialValue: note?.title ?? "")
        _noteContent = State(initialValue: note?.content ?? "")
        _noteDate = State(initialValue: note?.date ?? Date())
        self.contact = contact
        self.onSave = onSave
        self.existingNote = note
    }
    
    var body: some View {
        NavigationStack {
            Form {
                DatePicker("Date",
                           selection: $noteDate,
                           displayedComponents: [.date]
                )
                TextField("Title (what y'all discuss)", text: $noteTitle)
                TextEditor(text: $noteContent)
                    .frame(height: 250)
                
            }
            Section {
                Button(action: {
                    saveNote()
                    dismiss()
                }, label: {
                    Text("Save Note")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                })
                .disabled(!isFormValid)
                .padding()
            }
            
            .navigationTitle(existingNote == nil ? "Add Note" : "Edit Note")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveNote() {
        let newNote = Contact.Note(
            id: existingNote?.id ?? UUID(),
            date: noteDate,
            title: noteTitle,
            content: noteContent
        )
        onSave?(newNote)
        dismiss()
    }
}
