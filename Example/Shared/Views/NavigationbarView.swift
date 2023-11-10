//
//  NavigationbarView.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import IONavigation
import SwiftUI

struct NavigationbarView: View {
    var body: some View {
        VStack(spacing: 0) {
            Navigationbar(titleItem: AnyView(navigationTitleItem))
                .sidebarToggle(color: .blue)
                .navigationItem(image: Image(systemName: "magnifyingglass"), color: .blue, action: selectSearchTab)
            
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("primaryBackground"))
    }
    
    private var navigationTitleItem: some View {
        Text("Title Item")
            .font(.title)
            .padding(.vertical, 4)
            .padding(.horizontal, 12)
            .foregroundColor(.black)
            .clipShape(Capsule())
    }
    
    // MARK: - Variables
    
    @StateObject private var sidebarSelection = SidebarSelection.shared
    
    // MARK: - Functions
    
    private func selectSearchTab() {
        sidebarSelection.selectedViewID = HomeTab.search.rawValue
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationbarView()
    }
}
