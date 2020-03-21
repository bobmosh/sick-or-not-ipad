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
                .frame(maxWidth: 300, alignment: .leading)
                .navigationBarTitle("Sick or Not",displayMode: .large)
            }
        .padding(1)
            .navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct Sidebar: View {
    var body: some View {
        List {
            Section(header: Text("Visualize")) { NavigationLink(destination: analyticsView()) { Text("Visualize") } }
            Section(header: Text("Data Source")) {
                ForEach(states, id: \.id) { item in
                    NavigationLink(destination: sidebarState()) {
                        Text(item.name)
                    }
                }
            }
        }
    }
}

struct sidebarState: View {
    var body: some View {
        Form {
            ForEach(states, id: \.id) { item in
                Button(action: { }) {
                    Text(item.name)
                }
            }
        }
    }
}

struct analyticsView: View {
    @State var timePoint = 0.0

    var body: some View {
        VStack {
            Spacer()
            mapView(timePoint: $timePoint)
            Spacer()
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
        }
    }
}

struct mapView: View {
    var mockData: [CountryState] = states
    @Binding var timePoint: Double

    var body: some View {
        let highestSicknessRate = mockData.sorted { (lhs, rhs) -> Bool in
            return lhs.sicknessRate > rhs.sicknessRate
        }

        return ZStack {
            Image("Base Map")
                .resizable()
                .scaledToFit()
            ForEach(highestSicknessRate) { item in
                Image("State " + String(item.name))
                    .resizable()
                    .scaledToFit()
                    .opacity(item.sickCases != 0 ? (Double(item.sickCases) * self.timePoint) / Double(highestSicknessRate.first!.sickCases) : 0.0)
            }
        }.padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
