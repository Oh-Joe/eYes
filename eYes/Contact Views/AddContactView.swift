//
//  AddContactView.swift
//  eYes
//
//  Created by Antoine Moreau on 8/29/24.
//

import SwiftUI

struct AddContactView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) var dismissSheet

    @State var id = UUID()
    @State var firstName = ""
    @State var lastName = ""
    @State var jobTitle = ""
    @State var email = ""
    @State var phoneNumber = ""
    @State var photoName = ""
    
    var account: Account
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("First name:", text: $firstName)
                    TextField("Last name:", text: $lastName)
                    TextField("Job:", text: $jobTitle)
                    TextField("Email:", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    TextField("Cell number:", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
            }
            .navigationTitle("New Contact")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        let newContact = Contact(
                            id: id,
                            firstName: firstName,
                            lastName: lastName,
                            jobTitle: jobTitle,
                            email: email,
                            phoneNumber: phoneNumber,
                            notes: []
                        )
                        modelData.addContact(newContact, to: account)
                        dismissSheet()
                    }, label: {
                        Text("Save")
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismissSheet()
                    }, label: {
                        Text("Cancel")
                            .foregroundStyle(Color.red)
                    })
                }
            }
        }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    AddContactView(account: ModelData().accounts[0])
        .environmentObject(ModelData())
}
