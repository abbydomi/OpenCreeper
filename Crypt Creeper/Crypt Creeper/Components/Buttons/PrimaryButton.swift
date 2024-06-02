//
//  PrimaryButton.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 3/6/24.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color.ui.colorBGBlack)
            .foregroundStyle(Color.ui.textYellow)
            .font(.system(size: 30))
            .fontWeight(.black)
            .border(Color.ui.textYellow, width: 6)
    }
}
