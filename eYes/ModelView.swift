//
//  ModelView.swift
//  eYes
//
//  Created by Antoine Moreau on 8/29/24.
//

import Foundation

//MARK: Account
struct Account: Hashable, Codable, Identifiable {
    var id: UUID
    var name: String
    var accountType: AccountType
    var country: Country
    var status: Status
    var website: String
    var contacts: [Contact]
    var orders: [Order]
    var generalNotes: String
    
    enum AccountType: String, CaseIterable, Codable {
        case distri = "Distributor"
        case reseller = "Reseller"
        case kol = "Key Opinion Leader"
        case brand = "Brand"
        case bitchesbitch = "They my bitch's bitch"
    }
    
    enum Country: String, CaseIterable, Identifiable, Codable {
        case afghanistan = "Afghanistan"
        case albania = "Albania"
        case algeria = "Algeria"
        case andorra = "Andorra"
        case angola = "Angola"
        case antiguaAndBarbuda = "Antigua and Barbuda"
        case argentina = "Argentina"
        case armenia = "Armenia"
        case australia = "Australia"
        case austria = "Austria"
        case azerbaijan = "Azerbaijan"
        case bahamas = "Bahamas"
        case bahrain = "Bahrain"
        case bangladesh = "Bangladesh"
        case barbados = "Barbados"
        case belarus = "Belarus"
        case belgium = "Belgium"
        case belize = "Belize"
        case benin = "Benin"
        case bhutan = "Bhutan"
        case bolivia = "Bolivia"
        case bosniaAndHerzegovina = "Bosnia and Herzegovina"
        case botswana = "Botswana"
        case brazil = "Brazil"
        case brunei = "Brunei"
        case bulgaria = "Bulgaria"
        case burkinaFaso = "Burkina Faso"
        case burundi = "Burundi"
        case caboVerde = "Cabo Verde"
        case cambodia = "Cambodia"
        case cameroon = "Cameroon"
        case canada = "Canada"
        case centralAfricanRepublic = "Central African Republic"
        case chad = "Chad"
        case chile = "Chile"
        case china = "China"
        case colombia = "Colombia"
        case comoros = "Comoros"
        case congoBrazzaville = "Congo (Congo-Brazzaville)"
        case congoKinshasa = "Congo, Democratic Republic of the"
        case costaRica = "Costa Rica"
        case croatia = "Croatia"
        case cuba = "Cuba"
        case cyprus = "Cyprus"
        case czechRepublic = "Czech Republic"
        case denmark = "Denmark"
        case djibouti = "Djibouti"
        case dominica = "Dominica"
        case dominicanRepublic = "Dominican Republic"
        case eastTimor = "East Timor (Timor-Leste)"
        case ecuador = "Ecuador"
        case egypt = "Egypt"
        case elSalvador = "El Salvador"
        case equatorialGuinea = "Equatorial Guinea"
        case eritrea = "Eritrea"
        case estonia = "Estonia"
        case eswatini = "Eswatini (Swaziland)"
        case ethiopia = "Ethiopia"
        case fiji = "Fiji"
        case finland = "Finland"
        case france = "France"
        case gabon = "Gabon"
        case gambia = "Gambia"
        case georgia = "Georgia"
        case germany = "Germany"
        case ghana = "Ghana"
        case greece = "Greece"
        case grenada = "Grenada"
        case guatemala = "Guatemala"
        case guinea = "Guinea"
        case guineaBissau = "Guinea-Bissau"
        case guyana = "Guyana"
        case haiti = "Haiti"
        case honduras = "Honduras"
        case hungary = "Hungary"
        case iceland = "Iceland"
        case india = "India"
        case indonesia = "Indonesia"
        case iran = "Iran"
        case iraq = "Iraq"
        case ireland = "Ireland"
        case israel = "Israel"
        case italy = "Italy"
        case ivoryCoast = "Ivory Coast (Côte d'Ivoire)"
        case jamaica = "Jamaica"
        case japan = "Japan"
        case jordan = "Jordan"
        case kazakhstan = "Kazakhstan"
        case kenya = "Kenya"
        case kiribati = "Kiribati"
        case northKorea = "Korea, North"
        case southKorea = "Korea, South"
        case kosovo = "Kosovo"
        case kuwait = "Kuwait"
        case kyrgyzstan = "Kyrgyzstan"
        case laos = "Laos"
        case latvia = "Latvia"
        case lebanon = "Lebanon"
        case lesotho = "Lesotho"
        case liberia = "Liberia"
        case libya = "Libya"
        case liechtenstein = "Liechtenstein"
        case lithuania = "Lithuania"
        case luxembourg = "Luxembourg"
        case madagascar = "Madagascar"
        case malawi = "Malawi"
        case malaysia = "Malaysia"
        case maldives = "Maldives"
        case mali = "Mali"
        case malta = "Malta"
        case marshallIslands = "Marshall Islands"
        case mauritania = "Mauritania"
        case mauritius = "Mauritius"
        case mexico = "Mexico"
        case micronesia = "Micronesia"
        case moldova = "Moldova"
        case monaco = "Monaco"
        case mongolia = "Mongolia"
        case montenegro = "Montenegro"
        case morocco = "Morocco"
        case mozambique = "Mozambique"
        case myanmar = "Myanmar (Burma)"
        case namibia = "Namibia"
        case nauru = "Nauru"
        case nepal = "Nepal"
        case netherlands = "Netherlands"
        case newZealand = "New Zealand"
        case nicaragua = "Nicaragua"
        case niger = "Niger"
        case nigeria = "Nigeria"
        case northMacedonia = "North Macedonia"
        case norway = "Norway"
        case oman = "Oman"
        case pakistan = "Pakistan"
        case palau = "Palau"
        case panama = "Panama"
        case papuaNewGuinea = "Papua New Guinea"
        case paraguay = "Paraguay"
        case peru = "Peru"
        case philippines = "Philippines"
        case poland = "Poland"
        case portugal = "Portugal"
        case qatar = "Qatar"
        case romania = "Romania"
        case russia = "Russia"
        case rwanda = "Rwanda"
        case saintKittsAndNevis = "Saint Kitts and Nevis"
        case saintLucia = "Saint Lucia"
        case saintVincentAndTheGrenadines = "Saint Vincent and the Grenadines"
        case samoa = "Samoa"
        case sanMarino = "San Marino"
        case saoTomeAndPrincipe = "São Tomé and Príncipe"
        case saudiArabia = "Saudi Arabia"
        case senegal = "Senegal"
        case serbia = "Serbia"
        case seychelles = "Seychelles"
        case sierraLeone = "Sierra Leone"
        case singapore = "Singapore"
        case slovakia = "Slovakia"
        case slovenia = "Slovenia"
        case solomonIslands = "Solomon Islands"
        case somalia = "Somalia"
        case southAfrica = "South Africa"
        case southSudan = "South Sudan"
        case spain = "Spain"
        case sriLanka = "Sri Lanka"
        case sudan = "Sudan"
        case suriname = "Suriname"
        case sweden = "Sweden"
        case switzerland = "Switzerland"
        case syria = "Syria"
        case taiwan = "Taiwan"
        case tajikistan = "Tajikistan"
        case tanzania = "Tanzania"
        case thailand = "Thailand"
        case togo = "Togo"
        case tonga = "Tonga"
        case trinidadAndTobago = "Trinidad and Tobago"
        case tunisia = "Tunisia"
        case turkey = "Turkey"
        case turkmenistan = "Turkmenistan"
        case tuvalu = "Tuvalu"
        case uganda = "Uganda"
        case ukraine = "Ukraine"
        case unitedArabEmirates = "United Arab Emirates"
        case unitedKingdom = "United Kingdom"
        case unitedStates = "United States"
        case uruguay = "Uruguay"
        case uzbekistan = "Uzbekistan"
        case vanuatu = "Vanuatu"
        case vaticanCity = "Vatican City"
        case venezuela = "Venezuela"
        case vietnam = "Vietnam"
        case yemen = "Yemen"
        case zambia = "Zambia"
        case zimbabwe = "Zimbabwe"
        
        var id: String { self.rawValue }
    }
    
    enum Status: String, CaseIterable, Codable {
        case activeClient = "Active Client"
        case warmLead = "Warm Lead"
        case coldLead = "Cold Lead"
        case closedLost = "Not Interested"
    }
}

//MARK: Contact
struct Contact: Hashable, Codable, Identifiable {
    var id: UUID
    var firstName: String
    var lastName: String
    var jobTitle: String
    var email: String
    var phoneNumber: String
    var notes: [Note]
    
    struct Note: Hashable, Codable, Identifiable {
        var id: UUID
        var date: Date
        var title: String
        var content: String
    }
}

//MARK: Order
struct Order: Hashable, Codable, Identifiable {
    var id: UUID
    var issuedDate: Date
    var paidDate: Date
    var orderAmount: Double
    var paidAmount: Double
    var currency: Currency
    var orderNumber: String
    var isFullyPaid: Bool
    
    enum Currency: String, Codable {
        case eur = "EUR"
        case gbp = "GBP"
        case usd = "USD"
    }
}

//MARK: ModelData class
class ModelData: ObservableObject {
    @Published var accounts: [Account] = []
    @Published var contacts: [Contact] = []
    @Published var orders: [Order] = []
    
    // File paths for JSON files
    internal var accountsFilePath: URL
    internal var contactsFilePath: URL
    internal var ordersFilePath: URL
    
    init() {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        accountsFilePath = documentsDirectory.appendingPathComponent("accounts.json")
        contactsFilePath = documentsDirectory.appendingPathComponent("contacts.json")
        ordersFilePath = documentsDirectory.appendingPathComponent("orders.json")
        
        // Load initial data
        loadAccounts()
        loadContacts()
        loadOrders()
    }
    
    internal func saveJSON<T: Encodable>(_ value: T, to fileURL: URL) {
        do {
            let data = try JSONEncoder().encode(value)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save JSON: \(error)")
        }
    }
    
    internal func loadJSON<T: Decodable>(from fileURL: URL) -> T? {
        do {
            let data = try Data(contentsOf: fileURL)
            let value = try JSONDecoder().decode(T.self, from: data)
            return value
        } catch {
            print("Failed to load JSON: \(error)")
            return nil
        }
    }
    
    func addAccount(_ account: Account) {
        accounts.append(account)
        saveJSON(accounts, to: accountsFilePath)
    }
    
    func updateAccount(_ account: Account) {
        if let index = accounts.firstIndex(where: { $0.id == account.id }) {
            accounts[index] = account
            saveJSON(accounts, to: accountsFilePath)
        }
    }
    
    func deleteAccount(_ account: Account) {
        if let index = accounts.firstIndex(where: { $0.id == account.id }) {
            accounts.remove(at: index)
            saveJSON(accounts, to: accountsFilePath)
        }
    }
    
    func addContact(_ contact: Contact, to account: Account) {
        if let index = accounts.firstIndex(where: { $0.id == account.id }) {
            accounts[index].contacts.append(contact)
            saveJSON(accounts, to: accountsFilePath)
        } else {
            print("Account not found")
        }
    }
    
    func addNoteToContact(_ note: Contact.Note, to contact: Contact) {
        // Find the account containing the contact
        if let accountIndex = accounts.firstIndex(where: { $0.contacts.contains(where: { $0.id == contact.id }) }) {
            // Find the contact in the account
            if let contactIndex = accounts[accountIndex].contacts.firstIndex(where: { $0.id == contact.id }) {
                // Append the note to the contact's notes array
                accounts[accountIndex].contacts[contactIndex].notes.append(note)
                // Save the accounts array to disk
                saveJSON(accounts, to: accountsFilePath)
            } else {
                print("Contact not found in the account")
            }
        } else {
            print("Account not found for the given contact")
        }
    }

    
    func deleteNoteFromContact(_ note: Contact.Note, from contact: Contact) {
        if let accountIndex = accounts.firstIndex(where: { $0.contacts.contains(where: { $0.id == contact.id }) }) {
            if let contactIndex = accounts[accountIndex].contacts.firstIndex(where: { $0.id == contact.id }) {
                if let noteIndex = accounts[accountIndex].contacts[contactIndex].notes.firstIndex(where: { $0.id == note.id }) {
                    accounts[accountIndex].contacts[contactIndex].notes.remove(at: noteIndex)
                    saveJSON(accounts, to: accountsFilePath)
                }
            }
        } else {
            print("Contact not found")
        }
    }
    
    func updateNoteInContact(_ updatedNote: Contact.Note, in contact: Contact) {
        if let accountIndex = accounts.firstIndex(where: { $0.contacts.contains(where: { $0.id == contact.id }) }) {
            if let contactIndex = accounts[accountIndex].contacts.firstIndex(where: { $0.id == contact.id }) {
                if let noteIndex = accounts[accountIndex].contacts[contactIndex].notes.firstIndex(where: { $0.id == updatedNote.id }) {
                    accounts[accountIndex].contacts[contactIndex].notes[noteIndex] = updatedNote
                    saveJSON(accounts, to: accountsFilePath)
                }
            }
        } else {
            print("Contact not found")
        }
    }
    
    func addOrder(_ order: Order) {
        orders.append(order)
        saveJSON(orders, to: ordersFilePath)
    }
    
    private func loadAccounts() {
        accounts = loadJSON(from: accountsFilePath) ?? []
    }
    
    private func loadContacts() {
        contacts = loadJSON(from: contactsFilePath) ?? []
    }
    
    private func loadOrders() {
        orders = loadJSON(from: ordersFilePath) ?? []
    }
}

