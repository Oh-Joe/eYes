//
//  AccountListView.swift
//  eYes
//
//  Created by Antoine Moreau on 8/29/24.
//

import SwiftUI

struct AccountListView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showAddAccountSheet = false
    @State private var selectedAccount: Account? = nil
    @State private var sectionExpandedStates: [Account.Status: Bool] = [
        .activeClient: true,
        .warmLead: true,
        .coldLead: true,
        .closedLost: true
    ]
    
    // Sort accounts by status, return array of Account
    private func sortedAccounts(status: Account.Status) -> [Account] {
        return modelData.accounts
            .filter { $0.status == status }
            .sorted { $0.name < $1.name }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Account.Status.allCases, id: \.self) { status in
                    let accountsForStatus = sortedAccounts(status: status)
                    AccountSectionView(
                        status: status,
                        accounts: accountsForStatus,
                        accountCount: accountsForStatus.count,
                        isExpanded: sectionExpandedStates[status] ?? false,
                        toggleExpansion: {
                            withAnimation {
                                sectionExpandedStates[status]?.toggle()
                            }
                        },
                        deleteAction: { indexSet in
                            deleteAccount(at: indexSet, for: status)
                        },
                        selectedAccount: $selectedAccount
                    )
                }
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        selectedAccount = nil
                        showAddAccountSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showAddAccountSheet) {
                        AddAccountView(accountToEdit: selectedAccount)
                            .environmentObject(modelData)
                    }
                }
            }
            .sheet(item: $selectedAccount) { accountToEdit in
                AddAccountView(accountToEdit: accountToEdit)
                    .environmentObject(modelData)
            }
        }
    }
    
    // Delete function
    private func deleteAccount(at offsets: IndexSet, for status: Account.Status) {
        for index in offsets {
            let accountToDelete = sortedAccounts(status: status)[index]
            modelData.deleteAccount(accountToDelete)
        }
    }
}

struct AccountSectionView: View {
    var status: Account.Status
    var accounts: [Account]
    var accountCount: Int
    var isExpanded: Bool
    var toggleExpansion: () -> Void
    var deleteAction: (IndexSet) -> Void
    
    @Binding var selectedAccount: Account?
    
    var body: some View {
        Section(header: sectionHeaderView) {
            if isExpanded {
                ForEach(accounts) { account in
                    NavigationLink(destination: AccountDetailView(account: account)) {
                        AccountRow(account: account, selectedAccount: $selectedAccount)
                    }
                }
                .onDelete(perform: deleteAction)
            }
        }
    }
    
    private var sectionHeaderView: some View {
        HStack {
            HStack {
                Text("\(statusDisplayName)")
                Text("\(accountCount)")
                    .font(.caption)
                    .frame(width: 15, height: 15)
                    .background(Circle().fill(accountCount == 0 ? Color.secondary : Color.accentColor).opacity(0.3))
            }
            Spacer()
            if accountCount > 0 {
                Button(action: toggleExpansion) {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isExpanded ? 90 : 0))
                }
            }
        }
    }
    
    private var statusDisplayName: String {
        switch status {
        case .activeClient:
            return "Clients"
        case .warmLead:
            return "Warm Leads"
        case .coldLead:
            return "Cold Leads"
        case .closedLost:
            return "Not Interested"
        }
    }
}

struct AccountRow: View {
    var account: Account
    @Binding var selectedAccount: Account?

    var body: some View {
        HStack {
            Text(account.name)
            Spacer()
        }
        .contextMenu {
            Button("Edit Account") {
                selectedAccount = account
            }
        }
    }
}

struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountListView()
            .environmentObject(ModelData())
    }
}
