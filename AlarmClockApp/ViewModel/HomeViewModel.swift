//
//  HomeViewModel.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var alarms: [Alarm] = []
    
    
    
    
}

struct Alarm: Identifiable {
    
    var id: UUID
    
}
