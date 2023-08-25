//
//  ReadView.swift
//  HelloArduino
//
//  Created by Carlyn Maw on 8/24/23.
//

import SwiftUI
import SerialSession

struct ReadView: View {
    @EnvironmentObject var serialReader:SimpleSerialSession
    
    @State var reading:String = ""
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(reading)")
            Button("Read") {
                updateText()
            }
        }
        .padding()
    }
    
    func updateText() {
        //let result = serialReader.readLine()
        let result = serialReader.readBytes(count: 256)
        switch result {
        case .success(let message):
            reading = String(data: message, encoding: .utf8)!
        case .failure(let error):
            print(error)
        }
    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadView()
    }
}
