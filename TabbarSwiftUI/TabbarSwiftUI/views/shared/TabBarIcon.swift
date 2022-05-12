//
//  TabBarIcon.swift
//  TabbarSwiftUI
//
//  Created by SOTSYS303 on 11/05/22.
//

import SwiftUI

struct TabBarIcon: View {
    @EnvironmentObject var viewRouter: ViewRouter
    let assignedPage: Page

    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(viewRouter.currentPage == assignedPage ? .white : .black)
            //Since we have five icons, we want everyone to be one-fifth of the ContentView's width
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
                .foregroundColor(viewRouter.currentPage == assignedPage ? .white : .black)
            Spacer()
        }
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
        TabBarIcon(assignedPage:.menu, width: 44, height: 44, systemIconName: "", tabName: "")
    }
}
