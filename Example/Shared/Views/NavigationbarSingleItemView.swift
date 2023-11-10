//
//  NavigationbarSingleItemView.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import IONavigation
import SwiftUI

struct NavigationbarSingleItemView: View {
    var body: some View {
        VStack(spacing: 0) {
            Navigationbar(titleItem: AnyView(navigationTitleItem))
                .navigationItem(image: Image(systemName: "star.fill"), color: .blue, action: {})

            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("primaryBackground"))
    }

    private var navigationTitleItem: some View {
        HStack(alignment: .bottom, spacing: 12) {
            Text("Title Items")
                .font(.title)
                .foregroundColor(.black)

            Text(Date(), style: .date)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 12)
    }
}

#Preview {
    NavigationbarSingleItemView()
}
