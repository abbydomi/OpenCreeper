//
//  LeaderboardView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 3/6/24.
//

import SwiftUI

struct Leaderboard: View {
    @State var ver = true
    var body: some View {
        LeaderboardView(show: $ver )
    }
}

struct LeaderboardView: View {
    @Binding var show :Bool
    var body: some View {
        if show{
            PopUpsView(title: "Leaderboards", bodyContent: {
                Text("In progress")
                    .foregroundStyle(Color.white)
                    .font(.custom("m6x11", fixedSize: 24))
                    .padding(7)
            }).overlay(content: {
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            show.toggle()
                        } label: {
                            Image("")
                                .resizable()
                                .frame(width: 30,height:30)
                                .padding(.trailing,15)
                                .padding(.top,20)
                                .foregroundColor(Color.clear)
                        }
                    }
                    Spacer()
                }})
            .padding(.vertical,50)
            .padding(.horizontal)
        }
    }
}

struct LeaderboarView_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack{
            Color.ui.popUpColor
                .ignoresSafeArea()
            Leaderboard()
        }
    }
}

