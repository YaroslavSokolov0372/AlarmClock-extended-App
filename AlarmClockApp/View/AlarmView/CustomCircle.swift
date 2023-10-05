//
//  CustomCircle.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI

struct CustomCircle: View {
    
    let image: String
    
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: 40, height: 40)
            .shadow(radius: 4)
            .overlay {
                if image == "Sun" {
                    Image(image, bundle: .main)
                        .renderingMode(.template)
                        .foregroundStyle(.yellow)
                } else {
                    Image(image, bundle: .main)
                }
            }
    }
}

#Preview {
    CustomCircle(image: "Moon")
}
