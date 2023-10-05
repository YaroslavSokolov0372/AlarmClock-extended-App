//
//  AlarmCell.swift
//  AlarmClockApp
//
//  Created by Yaroslav Sokolov on 05/10/2023.
//

import SwiftUI

struct AlarmCell: View {
    
    @State var toggle = false
    @State var isOn = false
    
    var body: some View {
        
        VStack {
            HStack(alignment: .center) {
                Text("alarm")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                CustomToggle(isOn: $isOn)
                    .offset(x: -20)
                
            }
            .frame(width: 300, height: 70)
            
            Rectangle()
                .fill(.gray)
                .frame(width: 300, height: 1)
                
            
            HStack {
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image("Moon", bundle: .main)
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading) {
                                Text("to bed")
                                    .foregroundStyle(.gray)
                                Text("23:30")
                                    .font(.system(size: 35))
                                    .bold()
                                    .foregroundStyle(.black)
                            }

                        }
                        .offset(y: 20)
                        
                        Rectangle()
                            .frame(width: 2, height: 40)
                            .foregroundStyle(.gray)
                            .padding(.leading, 30)
                        
                        HStack {
                            Image("Sleep", bundle: .main)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .offset(x: -8)
                                .padding(.vertical, 4)
                            
                            Text("8 hours of sleep")
                                .foregroundStyle(.gray)
                        }
                        .padding(.leading, 30)
                        
                        
                        Rectangle()
                            .frame(width: 2, height: 40)
                            .foregroundStyle(.gray)
                            .padding(.leading, 30)
                        
                        
                        HStack {
                            Image("Sun", bundle: .main)
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading) {
                                Text("07:30")
                                    .font(.system(size: 35))
                                    .bold()
                                    .foregroundStyle(.black)
                                Text("wake up")
                                    .foregroundStyle(.gray)
                            }
                        }
                        .offset(y: -15)
                        
                    }
                    
                    Spacer()
                    
                    //                VStack {
                    //                    Text("To bed")
                    //                }
                    
                }
                
                Image("Arrow", bundle: .main)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing)
                
            }
            .padding(10)
        }
        .frame(width: 350, height: 400)
        
        //MARK: optional to see if its better with padding, if not, just remove or make specific size of it
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
        )
    }
}

#Preview {
    AlarmCell()
        .preferredColorScheme(.dark)
}
