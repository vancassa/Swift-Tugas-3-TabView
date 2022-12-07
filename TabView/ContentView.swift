//
//  ContentView.swift
//  TabView
//
//  Created by Vanessa Cassandra on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var selectedTab: Tabs = Tabs.browse
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                ShopListView()
                    .tabItem {
                        Image(systemName: "square.grid.2x2")
                        Text("Browse")
                    }
                    .tag(Tabs.browse)
                
                Text("Watch")
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Watch")
                    }
                    .tag(Tabs.watch)
                
                Text("Loans")
                    .tabItem {
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                        Text("Loans")
                    }
                    .tag(Tabs.loans)
                
                Text("Profile")
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                    .tag(Tabs.profile)
            } //: TABVIEW
            .navigationTitle(selectedTab.rawValue.capitalized)
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// MARK: - ENUM
enum Tabs: String {
    case browse
    case watch
    case loans
    case profile
    
}
