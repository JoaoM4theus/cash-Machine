import UIKit

enum Banknotes {
    case fifty
    case ten
    case five
    case two
}

func cashMachine(_ value: Int, bankNotes: [Banknotes]) -> String {
    if value <= 0 {
        let fiftyNotes = bankNotes.filter { $0 == .fifty}.count
        let tenNotes = bankNotes.filter { $0 == .ten}.count
        let fiveNotes = bankNotes.filter { $0 == .five}.count
        let twoNotes = bankNotes.filter { $0 == .two}.count
        var returnString = ""
        if fiftyNotes > 0 {
            returnString += " \(fiftyNotes) nota de 50,"
        }
        if tenNotes > 0 {
            returnString += " \(tenNotes) nota de 10,"
        }
        if fiveNotes > 0 {
            returnString += " \(fiveNotes) nota de 5,"
        }
        if twoNotes > 0 {
            returnString += " \(twoNotes) nota de 2,"
        }
        return String(returnString.dropLast().dropFirst())
    }

    var bankNotesCopy = bankNotes
    if value >= 50 {
        bankNotesCopy.append(.fifty)
        return cashMachine(value - 50, bankNotes: bankNotesCopy)
    }
    if value >= 10 {
        bankNotesCopy.append(.ten)
        return cashMachine(value - 10, bankNotes: bankNotesCopy)
    }
    if value >= 5 && ((value - 5) % 2 == 0) {
        bankNotesCopy.append(.five)
        return cashMachine(value - 5, bankNotes: bankNotesCopy)
    }
    
    bankNotesCopy.append(.two)
    return cashMachine(value - 2, bankNotes: bankNotesCopy)

}

let value = 8
print(cashMachine(value, bankNotes: []))
