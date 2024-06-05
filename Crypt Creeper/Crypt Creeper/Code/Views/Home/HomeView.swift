//
//  MainView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 17/1/23.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties

    @State var showHowToPlay = false
    @State var showSettings = false
    @State var showLeaderboards = false
    
    @EnvironmentObject var router: Router
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack{
                HomeBackgroundView()
                VStack {
                    Image("CryptCreeperLogo")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    Spacer()
                    VStack {
                        Button("PLAY") {
                            router.nextView(.game)
                        }
                        .buttonStyle(PrimaryButton())
                        Button("HOW TO PLAY") {
                            showHowToPlay = true
                        }
                        .buttonStyle(PrimaryButton())
                        HStack {
                            Button(action: {
                                showLeaderboards = true
                            }, label: {
                                Image(systemName: "trophy.fill")
                            })
                            .buttonStyle(PrimaryButton())
                            
                            Button(action: {
                                showSettings = true
                            }, label: {
                                Image(systemName: "gearshape.fill")
                            })
                            .buttonStyle(PrimaryButton())
                        }
                    }
                    .padding()
                }
                
                // MARK: - Navigation
                
                // Pop up views
                HowToPlayView(show: $showHowToPlay)
                LeaderboardView(show: $showLeaderboards)
                
                Color.clear
                    .navigationDestination(for: RoutePath.self) { route in
                        switch(route) {
                        case .game: GameView()
                        case.gameEnd(let score, let type): GameEndView(score: score, type: type)
                        }
                    }
            }
        }
    }
}

struct HomeBackgroundView: View {
    
    var body: some View {
        ZStack {
            // Color is clear to use overlay and display images properly, there's a swiftui
            // bug that makes all other images .fill if the background is .fill
            Color.clear
                .overlay {
                    Color.ui.colorBGPinkDark
                    Image("ImageBGTitle03")
                        .resizable()
                        .scaledToFill()
                }
            VStack {
                Spacer()
                Image("ImageBGTitle02")
                    .resizable()
                    .scaledToFit()
                Rectangle()
                    .fill(Color.ui.colorBGPurple)
                    .frame(height: 225)
                    .padding(.top, -25)
            }
            VStack {
                Spacer()
                Image("ImageBGTitle01")
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, -50)
                Rectangle()
                    .fill(Color.ui.colorBGBlack)
                    .frame(height: 150)
                    .padding(.top, -25)
            }
            Image("TitleKeyHero")
                .resizable()
                .scaledToFit()
                .padding()
            
        }
        .ignoresSafeArea()
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Router())
    }
}
