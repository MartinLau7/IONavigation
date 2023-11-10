//
//  Sidebar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Sidebar: View {
    public init(minWindowWidth: CGFloat = 800,
                minWindowHeight: CGFloat = 600,
                backgroundTranslucency: Bool = true,
                backgroundColor: Color,
                foregroundColor: Color,
                header: AnyView? = nil,
                footer: AnyView? = nil,
                itemGroups: [ItemGroup],
                itemFont: Font? = nil)
    {
        self.minWindowWidth = minWindowWidth
        self.minWindowHeight = minWindowHeight
        
        self.backgroundTranslucency = backgroundTranslucency
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.header = header
        self.itemGroups = itemGroups
        self.itemFont = itemFont
        self.footer = footer
        
        _showSidebar = State(initialValue: sidebarShown)
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            if showSidebar {
                SidebarView(selectedId: $sidebarSelection.selectedViewID,
                            backgroundTranslucency: backgroundTranslucency,
                            backgroundColor: backgroundColor,
                            foregroundColor: foregroundColor,
                            header: header,
                            footer: footer,
                            itemGroups: itemGroups,
                            itemFont: itemFont)
                    .frame(maxHeight: .infinity)
                    .frame(width: Values.sidebarWidth)
                    .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            
            Divider()
                .ignoresSafeArea(.all)
            
            if let view = itemGroups
                .flatMap({ $0.items })
                .filter({ $0.id == sidebarSelection.selectedViewID })
                .first?.view
            {
                view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, Values.middlePadding)
                    .ignoresSafeArea(.all)
            } else {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, Values.middlePadding)
                    .ignoresSafeArea(.all)
            }
        }
        .macWindowSize(minWidth: minWindowWidth, minHeight: minWindowHeight)
        .onAppear {
            DispatchQueue.main.async {
                self.sidebarSelection.selectedViewID = self.itemGroups.first?.items.first?.id ?? ""
            }
        }
        .onChange(of: itemGroups.first?.items) { newItems in
            self.sidebarSelection.selectedViewID = newItems?.first?.id ?? ""
        }
        .onChange(of: sidebarShown) { value in
            withAnimation(.easeInOut(duration: 0.2)) {
                showSidebar = value
            }
        }
    }
    
    // MARK: - Variables
    
    @AppStorage("sidebarShown") private var sidebarShown: Bool = true
    @State private var showSidebar: Bool = true
    
    @StateObject private var sidebarSelection = SidebarSelection.shared
    
    let minWindowWidth: CGFloat
    let minWindowHeight: CGFloat
    
    private let backgroundTranslucency: Bool
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let header: AnyView?
    private let footer: AnyView?
    private let itemGroups: [ItemGroup]
    private let itemFont: Font?
}
