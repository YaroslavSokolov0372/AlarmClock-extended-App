//
//  AlarmSetupViewModel.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import Foundation
import SwiftUI


class AlarmSetupViewModel: ObservableObject {
    
    
    @Published var moonCircle: Double = 0
    @Published var sunCircle: Double = 90
    
    
    var whenGoSleep: String {
        
        
        let hour = 360 / 24
        
        let hours = Int(moonCircle) / hour
        let minutes = (Int(moonCircle) % hour)
        let resultMnutes = (Double(minutes) * 0.8) * 5
        
        print(resultMnutes)
        
        return String(describing: hours)
    }
    var timeToSleep: String = ""
    var timeToWakeUp: String = ""
    
    
    
    

    func blackStrokeVisisbility() -> Double {
        let passedProcent = sunCircle / 3.6
        let sunPosition = passedProcent / 100
        let moonPassedProcent = moonCircle / 360
        if sunCircle > moonCircle {
            return sunPosition - moonPassedProcent
        } else {
            let moonPosition = 1 - moonPassedProcent
            return sunPosition + moonPosition
        }
    }
    func blackStrokeRotation() -> Double {
        
        //From Moon POV its 0
        let defaultPosition: Double = -90
        
        let moonPosition = 360 - moonCircle
        return defaultPosition - moonPosition + 360
    }
    func minsHoursVisibility(index: Int) -> Double {
        
        if moonCircle < sunCircle {
            let numberRange = moonCircle...sunCircle
            
            if numberRange.contains((Double(index) * 1.25)) {
                return 1
            } else {
                return 0
            }
        } else {
            let numberRang = sunCircle...moonCircle
            if numberRang.contains((Double(index) * 1.25)) {
                return 0
            } else {
                return 1
            }
        }
    }
}

