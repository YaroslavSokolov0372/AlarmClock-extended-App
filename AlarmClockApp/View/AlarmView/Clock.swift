//
//  Clock.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI


struct Clock: View {
    
    @EnvironmentObject var alarmVM: AlarmSetupViewModel
     
    var body: some View {
        
        GeometryReader { reader in
            
            
            
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 7)
                    .fill(.gray)
                    .frame(height: UIScreen.main.bounds.height / 3.2)
                
                Circle()
                    .trim(from: -0.0, to: alarmVM.blackStrokeVisisbility())
                    .stroke(lineWidth: 20)
                    .fill(.black)
                    .frame(height: UIScreen.main.bounds.height / 3.2)
                    .rotationEffect(.degrees(alarmVM.blackStrokeRotation()))
                
                ForEach(0..<288, id: \.self) { i in
                    Rectangle()
                        .fill(.white)
                        .frame(width: i % 12 == 0 ? 2 : 1, height: i % 12 == 0 ? 15 : 8)
                        .offset(y: (UIScreen.main.bounds.width - 125) / 2)
                        .rotationEffect(.degrees(Double(i) * 1.25))
                        .rotationEffect(.degrees(180))
                        .opacity(alarmVM.minsHoursVisibility(index: i))
                }
                
                CustomCircle(image: "Moon")
                    .offset(x: (UIScreen.main.bounds.width - 125) / 2)
                    .rotationEffect(.degrees(alarmVM.moonCircle))
                    .gesture(DragGesture().onChanged({ value in
                        let vector = CGVector(dx: value.location.x, dy: value.location.y)
                        let radians = atan2(vector.dy - 20, vector.dx - 20)
                        
                        var angle = radians * 180 / .pi
                        
                        if angle < 0 { angle = 360 + angle }
                        
                        
                        let roundeValue = 12.5 * Double(round(angle) / 12.5)
                            alarmVM.moonCircle = Double(roundeValue)

//                        print(alarmVM.moonCircle) 

                    }).onEnded({ value in
                        
                    }))
                    .rotationEffect(.degrees(-90))
                
                CustomCircle(image: "Sun")
                    .offset(x: (UIScreen.main.bounds.width - 125) / 2)
                    .rotationEffect(.degrees(alarmVM.sunCircle))
                    .gesture(DragGesture().onChanged({ value in
                        let vector = CGVector(dx: value.location.x, dy: value.location.y)
                        let radians = atan2(vector.dy - 20, vector.dx - 20)
                        
                        var angle = radians * 180 / .pi
                        
                        if angle < 0 { angle = 360 + angle }
                        
                        let roundeValue = 3 * Int(round(angle) / 3)
                        
                        alarmVM.sunCircle = Double(roundeValue)
                        
//                        print(alarmVM.sunCircle)
                        
                    }).onEnded({ value in
                        
                    }))
                    .rotationEffect(.degrees(-90))

                SleepInfo()
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    AlarmSetupView()
}
