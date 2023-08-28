//
//  ReadView.swift
//  HelloArduino
//
//  Created by Carlyn Maw on 8/24/23.
//

import SwiftUI
import SerialSession

//Assumes code on board is ForReadBytesView.ino

struct ReadAvailableBytesView: View {
    @EnvironmentObject var serialReader:SerialSession
    
    @State var reading:String = "Press button to retrieve available data"
    var body: some View {
        VStack {
            Text("\(reading)")
            Button("Read") {
                updateText()
            }
        }
        .padding()
    }
    
    func updateText() {
        //let result = serialReader.readLine()
        let result = serialReader.readAvailable()
        switch result {
        case .success(let message):
            var dataIterator = message.makeIterator()
            while let animal = dataIterator.next() {
                print(animal, terminator: ", ")
            }
            print()
            reading = String(data: message, encoding: .utf8) ?? "failure decoding."
        case .failure(let error):
            reading = "(no data available)"
            print(error)
        }
    }
}

struct ReadView_Previews: PreviewProvider {
    static var previews: some View {
        ReadAvailableBytesView()
    }
}
