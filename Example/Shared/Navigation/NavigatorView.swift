//
//  NavigatorView.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import IONavigation
import SwiftUI
// import AppKit

struct NavigatorView: View {
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            Tabbar(items: tabbarItems,
                   backgroundColor: Color("primaryBackground"),
                   foregroundColor: .blue,
                   style: .circular)
        } else {
            Sidebar(backgroundColor: Color("primaryBackground"),
                    foregroundColor: .blue,
                    header: AnyView(SidebarHeader(action: add)),
                    footer: AnyView(SidebarFooter()),
                    itemGroups: sidebarItemGroups)
        }
        #else
        Sidebar(backgroundTranslucency: false,
                backgroundColor: .yellow,
                foregroundColor: .blue,
                header: AnyView(SidebarHeader(action: add)),
                footer: AnyView(SidebarFooter()),
                itemGroups: sidebarItemGroups)
                
        #endif
    }
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
        
    // MARK: - Functions
    
    private func add() {
        // Example integration of an additional button in the sidebar
    }
    
    // MARK: - Tabs
    
    // There are different approaches to setup the items for the sidebar and navigationbar.
    // I chose to create computed variables to have the setup code all in one place, which looks cleaner and is easier to understand.
    
    private var tabbarItems: [Item] {
        HomeTab.items
    }
    
    // My favorite way of dealing with the data for the items is to create enums, which I can iterate and map to create the needed items.
    
    private var sidebarItemGroups: [ItemGroup] {
        [homeGroup, appGroup, settingsGroup]
    }
    
    private var homeGroup: ItemGroup {
        ItemGroup(id: "home", items: HomeTab.items)
    }
    
    private var appGroup: ItemGroup {
        ItemGroup(id: "library", header: "Library", items: LibraryTab.items)
    }
    
    private var settingsGroup: ItemGroup {
        ItemGroup(id: "settings", header: "Settings", items: SettingsTab.items, isCollapsable: false)
    }
}

struct NavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorView()
    }
}
