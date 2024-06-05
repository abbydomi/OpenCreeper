//
//  GameEndView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 3/6/24.
//

import SwiftUI

struct GameEndView: View {
    
    @EnvironmentObject var router: Router
    
    @State var score: String
    @State var type: GameEndType
    
    @State private var showHighscorelabel = false
    
    var body: some View {
        ZStack {
            GameEndBackgroundView(type: $type)
            VStack {
                Spacer()
                Image(type == .gameOver ? "GameOverLogo" : "WinLogo")
                    .resizable()
                    .scaledToFit()
                if showHighscorelabel {
                    Text("NEW HIGHSCORE!")
                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                        .foregroundColor(Color.ui.textYellow)
                }
                Text("SCORE: \(score)")
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                    .foregroundColor(Color.ui.text)
                Button("PLAY AGAIN") {
                    router.goBack()
                }
                .buttonStyle(PrimaryButton())
                Button("GO BACK") {
                    router.popToRoot()
                }
                .buttonStyle(PrimaryButton())
            }
            .padding()
        }
    }
}

struct GameEndBackgroundView: View {
    @Binding var type: GameEndType
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if type == .gameOver {
                    Image("ImageBGGameOver01")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 20)
                    Image("ImageKeyHeroGameOver")
                        .resizable()
                        .scaledToFit()
                        .padding(40)
                        .padding(.top, 20)
                    Image("ImageBGGameOver02")
                        .resizable()
                        .scaledToFit()
                        .padding(-20)
                } else {
                    Image("ImageBGWin01")
                        .resizable()
                        .scaledToFit()
                        .padding(-20)
                    Image("ImageBGWin03")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, -40)
                        .padding(20)
                    Image("ImageKeyHeroWin")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 40)
                    Image("ImageBGWin02")
                        .resizable()
                        .scaledToFit()
                        .padding(-20)
                }
            }
            .ignoresSafeArea()
            .background {
                type == .gameOver ? Color.ui.colorBGPurple : Color.ui.colorBGPinkDark
            }
            Color.black
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct GameEndView_Previews: PreviewProvider {
    static var previews: some View {
        GameEndView(score: "000", type: .win)
    }
}
