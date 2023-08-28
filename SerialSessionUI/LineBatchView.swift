//
//  LineBatchView.swift
//  SerialSessionUI
//
//  Created by Carlyn Maw on 8/28/23.
//

import SwiftUI
import SerialSession

struct LineBatchView: View {
    @EnvironmentObject var serialReader:SerialSession
    
    @State var availableLines:[String] = Array(repeating: "No data yet", count: 1)
    @State var remainder = ""
    
    var body: some View {
        VStack {
            Button("Read") {
                updateLines()
            }
            ScrollView {
                ForEach(Array(availableLines.enumerated()), id: \.offset) {
                    Text("\($0.offset): \($0.element)").monospaced()
                }
            }
        }
    }
    
    func updateLines() {
        //let result = serialReader.readLine()
        let result = serialReader.readLines()
        switch result {
        case .success(let data):
            var dataIterator = data.lines.makeIterator()
            while let line = dataIterator.next() {
                print(line, terminator: ", ")
            }
            print()
            //Maybe?
            availableLines = data.lines
            availableLines[0] = remainder + availableLines[0]
            remainder = data.remainder

        case .failure(let error):
            availableLines = Array(repeating: "No data available", count: 1)
            remainder = ""
            print(error)
        }
    }
    

}

struct LineBatchView_Previews: PreviewProvider {
    static var previews: some View {
        LineBatchView()
    }
}
