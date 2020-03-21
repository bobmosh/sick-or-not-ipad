//
//  State.swift
//  Corvid-19
//
//  Created by Ferdinand Goeldner on 21.03.20.
//  Copyright © 2020 Ferdinand Goeldner. All rights reserved.
//

import Foundation

enum GermanState: CaseIterable {
    case BadenWuertemberg
    case Bayern
    case Berlin
    case Brandenburg
    case Bremen
    case Hamburg
    case Hessen
    case MacklenburgVorpommern
    case Niedersachsen
    case NordrheiWestfalen
    case RheinlandPfalz
    case Saarland
    case Sachsen
    case SachsenAnhalt
    case SchleswigHolstein
    case Thueringen

}

class CountryState: Identifiable {
    public let id = UUID()
    public var name: String
    public var totalInhabitants: Int
    public var sickCases: Int
    public var deathCases: Int
    public var sicknessRate: Double {
        get {
            return Double(sickCases) / Double(totalInhabitants)
        }
    }

    init(name: String,
         totalInhabitantsinMio: Int = 0,
         sickCases: Int = 0,
         deathCases: Int = 0) {
        self.name = name
        self.totalInhabitants = totalInhabitantsinMio * 1000000
        self.sickCases = sickCases
        self.deathCases = deathCases
    }
}
