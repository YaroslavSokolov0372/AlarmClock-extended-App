//
//  SleepInfo.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI

struct SleepInfo: View {
    
    @EnvironmentObject var alarmVM: AlarmSetupViewModel
    
    var body: some View {
        
        VStack {
            Text(alarmVM.whenGoSleep)
        }
    }
}

//#Preview {
//    SleepInfo()
//}
