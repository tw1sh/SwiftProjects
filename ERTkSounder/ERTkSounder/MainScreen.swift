//
//  ContentView.swift
//  ERTkSounder
//
//  Created by Илья Чихладзе on 25.06.2022.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        VStack{
            Text("ER Tank Sounder")
                .font(.largeTitle)
        ERTkView()
            .padding()
            Text("Created by Chikhladze Illia")
                
        }
    }
}














struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
