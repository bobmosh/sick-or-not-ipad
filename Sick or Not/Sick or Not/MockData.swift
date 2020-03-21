//
//  MockData.swift
//  Corvid-19
//
//  Created by Ferdinand Goeldner on 21.03.20.
//  Copyright © 2020 Ferdinand Goeldner. All rights reserved.
//

import Foundation

class MockData {
    static func generateMockSubjects() -> [TestSubject] {
        return [TestSubject(subjectName: "Max Musterman",
                            adress: "Richard-Wagner-Straße 27, Stuttgart",
                            testStatus: .Pending),
                TestSubject(subjectName: "Jan Musterman",
                            adress: "Wagnerstraße 27, Ulm",
                            testStatus: .Positive),
                TestSubject(subjectName: "Jan Musterman",
                            adress: "Wagnerstraße 27, Ulm",
                            testStatus: .Positive),
                TestSubject(subjectName: "Jan Musterman",
                            adress: "Wagnerstraße 27, Ulm",
                            testStatus: .Negative),
                TestSubject(subjectName: "Jan Musterman",
                            adress: "Wagnerstraße 27, Ulm",
                            testStatus: .Untested)]
    }
    
    static func generateMockStates() -> [CountryState] {
        return [CountryState(name: "Baden-Würtemberg",
                             totalInhabitantsinMio: 10880,
                             sickCases: 3668,
                             deathCases: 0),
                CountryState(name: "Bayern",
                             totalInhabitantsinMio: 12844,
                             sickCases: 3107,
                             deathCases: 0),
                CountryState(name: "Berlin",
                             totalInhabitantsinMio: 3520,
                             sickCases: 868,
                             deathCases: 0),
                CountryState(name: "Brandenburg",
                             totalInhabitantsinMio: 2485,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Bremen",
                             totalInhabitantsinMio: 671,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Hamburg",
                             totalInhabitantsinMio: 1787,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Hessen",
                             totalInhabitantsinMio: 6176,
                             sickCases: 1080,
                             deathCases: 0),
                CountryState(name: "Mecklenburg-Vorpommern",
                             totalInhabitantsinMio: 1612,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Niedersachsen",
                             totalInhabitantsinMio: 7927,
                             sickCases: 1262,
                             deathCases: 0),
                CountryState(name: "Nordrhein-Westfalen",
                             totalInhabitantsinMio: 17866,
                             sickCases: 6740,
                             deathCases: 0),
                CountryState(name: "Rheinland-Pfalz",
                             totalInhabitantsinMio: 4053,
                             sickCases: 1062,
                             deathCases: 0),
                CountryState(name: "Saarland",
                             totalInhabitantsinMio: 996,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Sachsen",
                             totalInhabitantsinMio: 2053,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Sachsen-Anhalt",
                             totalInhabitantsinMio: 2245,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Schleswig-Holstein",
                             totalInhabitantsinMio: 2859,
                             sickCases: 0,
                             deathCases: 0),
                CountryState(name: "Thüringen",
                             totalInhabitantsinMio: 2171,
                             sickCases: 0,
                             deathCases: 0)]
    }
}
