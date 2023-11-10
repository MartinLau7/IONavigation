//
//  SidebarFooter.swift
//  IONavigationExample (iOS)
//
//  Created by MartinLau on 25/10/2023.
//

import SwiftUI

struct SidebarFooter: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 65, height: 65, alignment: .leading)
                .cornerRadius(65 / 2)
                .foregroundColor(.yellow)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))

            VStack {
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 100, height: 14)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 80, height: 7)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 52, height: 7)
                    .opacity(0.5)
            }
            Spacer()
        }
    }
}

#Preview {
    SidebarFooter()
}
