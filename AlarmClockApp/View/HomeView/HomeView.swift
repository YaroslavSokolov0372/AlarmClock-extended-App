//
//  HomeView.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeVM = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background", bundle: .main)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    VStack {
                        Header()
                    }
                    .padding(.bottom)
                    .background(
                        Color.white
                    )
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 15) {
                            ForEach(homeVM.alarms, id: \.id) { _ in
                                AlarmCell()
                            }
                            //TODO: make preference change
                            /// If on top, then offset 40 if scroll, than 0 (its by y)
                                                        .offset(y: 40)
                        }
                    }
                    .overlay {
                        VStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: UIScreen.main.bounds.width, height: 10)
                                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 12)
                            
                            Spacer()
                        }
                    }
                }
                .onAppear(perform: {
                    for _ in 0..<3 {
                        homeVM.alarms.append(Alarm(id: .init()))
                    }
                })
            }
        }
    }
}

#Preview {
    HomeView()
}
