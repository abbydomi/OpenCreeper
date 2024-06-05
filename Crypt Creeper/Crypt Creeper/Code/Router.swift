//
//  Router.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 3/6/24.
//

import SwiftUI

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func nextView(_ type: RoutePath) {
        path.append(type)
    }
}

enum RoutePath: Hashable {
    case game
    case gameEnd(String, GameEndType)
}

enum GameEndType {
    case win
    case gameOver
}
