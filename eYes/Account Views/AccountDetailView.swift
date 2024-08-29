//
//  AccountDetailView.swift
//  eYes
//
//  Created by Antoine Moreau on 8/29/24.
//

import SwiftUI

struct AccountDetailView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var isShowingAddContactSheet: Bool = false
    @State private var isShowingSafariView: Bool = false
    @State private var isShowingInvalidURLAlert: Bool = false
    @State private var selectedAccount: Account?
    
    var account: Account
    
    var body: some View {
        NavigationStack {
            // Other account details here
            List {
                
                Section {
                    HStack {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(Color.secondary)
                        Text(account.status.rawValue)
                    }
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundStyle(Color.secondary)
                        Text("\(account.country.rawValue)")
                    }
                    HStack {
                        Image(systemName: "list.clipboard")
                            .foregroundStyle(Color.secondary)
                        Text(account.accountType.rawValue)
                    }
                    
                    Button {
                        var urlString = account.website
                        if !urlString.hasPrefix("http://") && !urlString.hasPrefix("https://") {
                            urlString = "https://" + urlString
                        }
                        
                        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                            isShowingSafariView = true
                        } else {
                            isShowingInvalidURLAlert = true
                        }
                    } label: {
                        HStack {
                            Image(systemName: "globe")
                                .foregroundStyle(Color.secondary)
                            Text(account.website)
                        }
                    }
                } header: {
                    Text("Account details")
                }
                
                if !account.generalNotes.isEmpty {
                    Section {
                        Text(account.generalNotes)
                            .lineLimit(2)
                            .truncationMode(.tail)
                    } header: {
                        Text("Notes")
                    }
                }
                
                Section {
                    Button {
                        isShowingAddContactSheet.toggle()
                    } label: {
                        Label("New Contact", systemImage: "person.crop.circle.badge.plus")
                            .font(.caption)
                            .fontWeight(.heavy)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .tint(.accentColor)
                    .sheet(isPresented: $isShowingAddContactSheet) {
                        AddContactView(account: account)
                    }
                    if !account.contacts.isEmpty {
                        ForEach(account.contacts, id: \.id) { contact in
                            NavigationLink(destination: ContactDetailView(contact: contact)) {
                                ContactRowView(contact: contact)
                            }
                        }
                    }
                } header: {
                    Text("Contacts")
                }
                
                Section {
                    HStack {
                        Button {
                            // Action to add a new order
                        } label: {
                            Label("New Order", systemImage: "banknote")
                                .foregroundStyle(Color.green)
                                .font(.caption)
                                .fontWeight(.heavy)
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                        .tint(.green)
                    }
                } header: {
                    Text("Orders")
                }

                
            }
            .navigationTitle(account.name)
            .fullScreenCover(isPresented: $isShowingSafariView) {
                if let url = URL(string: "https://\(account.website)"), UIApplication.shared.canOpenURL(url) {
                    SafariView(url: url)
                } else {
                    // Handle the error or provide a default view
                    Text("Invalid URL")
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
            .alert(isPresented: $isShowingInvalidURLAlert) {
                Alert(
                    title: Text("Invalid URL"),
                    message: Text("The URL \"\(account.website)\" is invalid and cannot be opened."),
                    dismissButton: .default(Text("OK"))
                )
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        selectedAccount = account
                        // Show the AddAccountView for editing
                    }
                }
            }
            .sheet(item: $selectedAccount) { accountToEdit in
                AddAccountView(accountToEdit: accountToEdit)
                    .environmentObject(modelData)
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    let defaultAccount = Account(
        id: UUID(),
        name: "Default Account",
        accountType: .distri,
        country: .cambodia,
        status: .activeClient,
        website: "https://example.com",
        contacts: [],
        orders: [],
        generalNotes: "No notes available"
    )
    return AccountDetailView(account: modelData.accounts.first ?? defaultAccount)
        .environmentObject(modelData)
}
