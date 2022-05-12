//
//  ContentView.swift
//  TabbarSwiftUI
//
//  Created by SOTSYS303 on 11/05/22.
//

import SwiftUI

struct ContentView: View {
    
    var order = Order()
    @StateObject var viewRouter = ViewRouter()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    MenuView()
                        .opacity(viewRouter.currentPage == .menu ? 1 : 0)
                    OrderView()
                        .opacity(viewRouter.currentPage == .order ? 1 : 0)
                    VStack {
                        Spacer()
                        Text("Notifications")
                        Spacer()
                    }
                    .opacity(viewRouter.currentPage == .notifications ? 1 : 0)
                    VStack {
                        Spacer()
                        Text("Setting")
                        Spacer()
                    }
                    .opacity(viewRouter.currentPage == .settings ? 1 : 0)
                }
                
                HStack {
                    TabBarIcon(assignedPage: .menu, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "filemenu.and.cursorarrow", tabName: "Menu")
                    TabBarIcon(assignedPage: .order, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "Order")
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/6, height: geometry.size.width/6)
                            .shadow(radius: 1)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/7-4 , height: geometry.size.width/7-4)
                            .foregroundColor(Color.red)
                    }
                    .offset(y: -geometry.size.height/8/2)
                    .onTapGesture {
                        print("Clicked")
                    }

                    TabBarIcon(assignedPage: .notifications, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "bell", tabName: "Notifications")
                    TabBarIcon(assignedPage: .settings, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "square.and.pencil", tabName: "Settings")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color.teal)
                .padding(0)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .environmentObject(order)
        .environmentObject(viewRouter)
        
//                TabView {
//                    MenuView()
//                        .tabItem {
//                            Label("Menu", systemImage: "list.dash")
//                        }
//                    OrderView()
//                        .tabItem {
//                            Label("Order", systemImage: "list.dash")
//                        }
//                }
//                .environmentObject(order)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}


