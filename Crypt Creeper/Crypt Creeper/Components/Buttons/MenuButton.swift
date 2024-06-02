//
//  MenuButton.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 2/6/24.
//

import SwiftUI

// TODO: Legacy button, delete.

struct MenuButton: View {

    @State var title: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/1.1, height: UIScreen.main.bounds.size.height/11.1)
                .foregroundColor(Color.ui.textYellow)
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/1.1-10, height: UIScreen.main.bounds.height/11.1-10)
                .foregroundColor(Color.ui.colorBGBlack)
            
            Text(title)
                .foregroundColor(Color.ui.textYellow)
                .font(.system(size: 30))
                .fontWeight(.black)
        }
    }
}
