//
//  ViewRouter.swift
//  TabbarSwiftUI
//
//  Created by SOTSYS303 on 11/05/22.
//

import Foundation
import SwiftUI


enum Page {
    case menu
    case order
    case center
    case notifications
    case settings
}


class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .menu
}
