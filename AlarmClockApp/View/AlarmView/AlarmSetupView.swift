//
//  NewAlarmView.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI

struct AlarmSetupView: View {
    
    @StateObject var alarmVM = AlarmSetupViewModel()
    
    var body: some View {
        
        Clock()
            .environmentObject(alarmVM)
    }
}

#Preview {
    AlarmSetupView()
}
