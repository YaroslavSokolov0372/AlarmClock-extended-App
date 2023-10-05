//
//  CustomToggle.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI

struct CustomToggle: View {

    @Binding var isOn: Bool
    
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: 30, height: 30)
            .offset(x: isOn ? 14 : -14)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(.black)
                    .frame(width: 67, height: 40)
                    .overlay(content: {
                        HStack {
                            Text("on")
                                .foregroundStyle(.gray)
                            Text("off")
                                .foregroundStyle(.gray)
                        }
                    })
                    
            )
            .onTapGesture {
                withAnimation {
                    isOn.toggle()
                }
            }
    }
}

#Preview {
    CustomToggle(isOn: .constant(true))
}
