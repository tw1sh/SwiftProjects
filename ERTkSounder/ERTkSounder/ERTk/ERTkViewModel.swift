//
//  ERTkViewModel.swift
//  ERTkSounder
//
//  Created by Илья Чихладзе on 25.06.2022.
//

import Foundation
import SwiftUI

extension ERTkView {
    class ERTkViewModel : ObservableObject {
        @Published var tankList:[ERTk] = [sumpTk,bilgeHoldingTk,oilBilgeTk,hfoTk,sludgeTk,mgoTk,scavTk,cwdTk]
        @Published var soundedValue:[String] = ["","","","","","","",""]
        @Published var trim = ""
        var realTrim : Int {
            trimValueInt(value: trim)
        }
        
        
        public func countTankVolume(trim:Int, tank:ERTk, soundedValue:String?)->String {
            if let soundedValueDouble = Double(soundedValue!){
                if soundedValueDouble > tank.depth{
                    return "ERROR"
                } else {
                let valueInMM = soundedValueDouble * 10
                let arrayIndex = Int(soundedValueDouble/tank.step)
                let trc = trim
                let volume : Double = ((tank.mainArray[trc][arrayIndex + 1]) - (tank.mainArray[trc][arrayIndex])) / 20 * (valueInMM - Double(arrayIndex) * tank.step) + (tank.mainArray[trc][arrayIndex])
                let volumeRounded = Double(Int(volume*100))/100
                return ("\(volumeRounded)")
                }
            } else {return ""}
        }
        
        public func trimValueInt(value:String)->Int{
            if let value = Double(value){
                if value <= -4 {
                    return 0
                } else if value > -4 && value <= -3 {
                    return 1
                } else if value > -3 && value <= -2 {
                    return 2
                } else if value > -2 && value <= -1.5 {
                    return 3
                } else if value > -1.5 && value <= -1 {
                    return 4
                } else if value > -1 && value <= -0.5 {
                    return 5
                } else if value > -0.5 && value <= 0 {
                    return 6
                } else if value > 0 && value <= 0.5 {
                    return 6
                } else if value > 0.5 {
                    return 7
                }
            }
            print(value)
            return 6
        }
    }
}
