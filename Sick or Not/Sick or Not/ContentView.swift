//
//  ContentView.swift
//  Corvid-19
//
//  Created by Ferdinand Goeldner on 21.03.20.
//  Copyright © 2020 Ferdinand Goeldner. All rights reserved.
//

import SwiftUI

let states = MockData.generateMockStates()

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            .navigationBarTitle("Sick or Not",displayMode: .large)
        }   .padding(0.3)
            .navigationViewStyle(DefaultNavigationViewStyle())
            .background(Color.secondary)
    }
}

struct Sidebar: View {
    var body: some View {
        Form {
            Section(header: Text("Visualize")) { NavigationLink(destination: AnalyticsView()) { Text("Visualize") } }
            Section(header: Text("Data Source")) {
                ForEach(states, id: \.id) { item in
                    NavigationLink(destination: TestSubjectView(countryState: .BadenWuertemberg)) {
                        Text(item.name)
                    }
                }
            }
        }
    }
}

struct TestSubjectView: View {
    var data = MockData.generateMockSubjects().shuffled()
    var countryState: GermanState
    @State var filter: TestStatus = .Undefined

    var body: some View {
        VStack {
            Picker("Filter by:", selection: $filter) {
                Text("All")
                    .tag(TestStatus.Undefined)
                Text("Negative")
                    .tag(TestStatus.Negative)
                Text("Positive")
                    .tag(TestStatus.Positive)
                Text("Pending")
                    .tag(TestStatus.Pending)
                Text("Untested")
                    .tag(TestStatus.Untested)
                }
            .pickerStyle(SegmentedPickerStyle())
                .padding()
            Form {
                ForEach(data.filter({ sub -> Bool in
                    if filter == .Undefined { return true }
                    return sub.testStatus == filter
                }), id: \.id) { item in
                    DataEntry(item: item)
                }
            }
        }
    }
}

struct DataEntry: View {
    var item: TestSubject
    @State var showingModal = false

    var body: some View {
        HStack {
            Text(item.subjectName)
            Spacer()
            Text(item.testStatus.rawValue)

            Button("") {
                self.showingModal.toggle()
            }.sheet(isPresented: $showingModal) {
                TestSubjectDetailView(item: self.item) { self.showingModal = false }
            }
        }.foregroundColor(item.statusColor)
    }
}

struct TestSubjectDetailView: View {
    var item: TestSubject
    var onDismiss: () -> ()

    var body: some View {
        VStack {
            ZStack {
                Text(item.subjectName)
                    .font(Font.title)
                    .multilineTextAlignment(.center)
                Button(action: onDismiss) { Text("Done") }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
            }.frame(maxWidth: .infinity)
            .padding([.leading,.trailing,.top])
            Form {
                Section(header: Text("Name")) {
                    Text(item.subjectName)
                }
                Section(header: Text("Adress")) {
                    Text(item.adress)
                }
                Section(header: Text("Test Status")) {
                    Text(item.testStatus.rawValue)
                        .foregroundColor(item.statusColor)
                }
                Text("ID: " + item.id.uuidString)
            }
        }
    }
}

struct AnalyticsView: View {
    @State var timePoint = 0.0
    @State var caseFilter = 0

    var body: some View {
        ScrollView {
            VStack {
                Picker(selection: $caseFilter, label: Text("Filter for:")) {
                    Text("Sickness Cases").tag(0)
                    Text("Mortality Cases").tag(1)
                    Text("Recovery Cases").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                mapView(timePoint: $timePoint, caseFilter: $caseFilter)
                Button(action: {
                    UIApplication.shared.open(URL(string: "https://www.vexels.com/vectors/preview/149109/germany-states-map")!)
                }) {
                    Text("Image from vexels.com")
                }.foregroundColor(Color.gray)
                VStack {
                    HStack {
                        Button(action: { }) {
                            Text("31.01.2020")
                        }
                        Spacer()
                        Button(action: { }) {
                            Text("Today")
                        }
                    }
                    Slider(value: $timePoint, in: 0...1, step: 0.01)
                }.padding()
            }.navigationBarTitle("Visualize")
        }
    }
}

struct mapView: View {
    var mockData: [CountryState] = states
    @Binding var timePoint: Double
    @Binding var caseFilter: Int

    var body: some View {
        let highestSicknessRate = mockData.sorted { (lhs, rhs) -> Bool in
            return lhs.sicknessRate > rhs.sicknessRate
        }

        var filterColor: Color {
            get {
                switch caseFilter {
                case 0:
                    return Color.blue
                case 1:
                    return Color.red
                case 2:
                    return Color.green
                default:
                    return Color.black
                }
            }
        }

        return ZStack {
            Image("Base Map")
                .resizable()
                .scaledToFit()
                .opacity(0.5)
            ForEach(highestSicknessRate) { item in
                Image("State " + String(item.name))
                    .resizable()
                    .scaledToFit()
                    .opacity(item.sickCases != 0 ? (Double(item.sickCases) * self.timePoint) / Double(highestSicknessRate.first!.sickCases) : 0.0)
            }
        }
        .padding(16)
        .colorMultiply(filterColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
