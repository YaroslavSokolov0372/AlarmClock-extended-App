//
//  Header.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            Text("Alarm Clock")
                .font(.largeTitle)
            NavigationLink(destination: AlarmSetupView().navigationBarBackButtonHidden()) {
                Image(systemName: "plus")
                    .foregroundStyle(.black)
                    .font(.system(size: 25))
                    .padding(.trailing, 20)
                    .frame(width: 100, alignment: .trailing)                
            }
                
        }
        .frame(width: UIScreen.main.bounds.width)
        
    }
}

#Preview {
    Header()
}
