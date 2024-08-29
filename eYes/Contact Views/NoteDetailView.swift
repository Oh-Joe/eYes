//
//  NoteDetailView.swift
//  eYes
//
//  Created by Antoine Moreau on 8/29/24.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var modelData: ModelData
    
    var note: Contact.Note
    
    var body: some View {
        NavigationStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(note.date, format: .dateTime.month(.abbreviated).day().year())
                        .fontWeight(.bold)

                    Text(note.content)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Text(note.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
        }
        .padding(.top, 15)
    }
}


#Preview {
    NoteDetailView(note: ModelData().contacts[0].notes[0])
}
