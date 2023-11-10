//
//  SidebarHeader.swift
//  IONavigationExample (iOS)
//
//  Created by MartinLau on 10/11/2023.
//

import SwiftUI

struct SidebarHeader: View {
    // MARK: - Variables

    @State private var isHovering = false

    let action: (() -> Void)?

    var body: some View {
        HStack(spacing: 0) {
            Text("IONavigationExample")
                .font(.custom("ARDESTINE", size: 28))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 44)

            if let action {
                Button(action: action) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.primary)
                        .frame(width: 16, height: 16)
                        .padding(16 / 2)
                        .background(isHovering ? .blue.opacity(0.1) : .clear)
                        .cornerRadius(16)
                }
                .buttonStyle(.plain)
                .background(.white.opacity(0.00001))
                .cornerRadius(8)
                .onHover { hovering in
                    self.isHovering = hovering
                }
                .help("add")
            }
        }
        .padding(.leading, 12 / 2)
        .padding(.top, 16)
    }
}

#if DEBUG
#Preview {
    SidebarHeader {}
}
#endif
