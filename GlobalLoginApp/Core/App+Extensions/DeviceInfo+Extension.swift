//
//  DeviceInfo+Extension.swift
//  GlobalLoginApp
//
//   Created by Onur ÇAM on 28.03.2024.
//

import Foundation


import SwiftUI

extension Binding where Value == Bool {
    
    init<T>(value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}

extension Bundle {
    var versionNumber: String? {
        infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var formattedVersion: String {
        "\(versionNumber ?? "1.0.0")"
    }
}

extension UIDevice {
    static var numericUUID : String? {
        guard let uuidString = UIDevice.current.identifierForVendor?.uuidString else {
            return nil
        }
        // A letter-to-number mapping table for converting letter characters to numbers
        let characterMap: [Character: String] = [
            "-": "",
            "a": "0", "A": "1",
            "b": "2", "B": "3",
            "c": "4", "C": "5",
            "d": "6", "D": "7",
            "e": "8", "E": "9",
            "f": "10", "F": "11",
            "g": "12", "G": "13",
            "h": "14", "H": "15",
            "i": "16", "I": "17",
            "j": "18", "J": "19",
            "k": "20", "K": "21",
            "l": "22", "L": "23",
            "m": "24", "M": "25",
            "n": "26", "N": "27",
            "o": "28", "O": "29",
            "p": "30", "P": "31",
            "q": "32", "Q": "33",
            "r": "34", "R": "35",
            "s": "36", "S": "37",
            "t": "38", "T": "39",
            "u": "40", "U": "41",
            "v": "42", "V": "43",
            "w": "44", "W": "45",
            "x": "46", "X": "47",
            "y": "48", "Y": "49",
            "z": "50", "Z": "51",
            "=": "52"
        ]
        // 4DA29C09-E404-4CBF-9EBC-E0142D986124
        // We convert the UUID string by replacing its letters with numbers
        let numericUUID = uuidString.map{characterMap[$0] ?? String($0)}.joined()
        
        return numericUUID
    }
    
}

