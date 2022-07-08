//
//  TKView.swift
//  ERTkSounder
//
//  Created by Илья Чихладзе on 25.06.2022.
//

import SwiftUI

struct ERTkView: View {
    @StateObject var ervm = ERTkViewModel()
    var body: some View {
        HStack {
            Text("Enter TRIM")
                .padding(.horizontal)
            Spacer()
            TextField("m",text: $ervm.trim)
                .padding(.horizontal)
        }
        
        List(ervm.tankList) {tank in
            VStack {
                Text("\(tank.name)")
                
                HStack{
                    TextField("cm", text: $ervm.soundedValue[tank.indexNumber])
                    Text("Result: ")
                    Text(String(ervm.countTankVolume(trim:ervm.trimValueInt(value: ervm.trim), tank: tank, soundedValue: ervm.soundedValue[tank.indexNumber]))
                    )
                    Text(" m3")
                }
                
            }
        }
    }
}





struct TKView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

