//
//  WriteView.swift
//  SerialSessionUI
//
//  Created by Carlyn Maw on 8/25/23.
//

import SwiftUI
import SerialSession

//Assumes code on board is ForWriteView.ino

struct WriteView: View {
    @EnvironmentObject var serialWriter:SerialSession
    
    @State var brightness:Double = 0.5
    @State var toTransmit:UInt8 = UInt8(0.5 * 255)
    @State var sent = "–"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("slider:\(brightness), toSend:\(toTransmit) (\(sent))").monospaced()
            Slider(value: $brightness) { editing in
                if !editing {
                    toTransmit = UInt8(brightness * 255)
                    let result = serialWriter.send(toTransmit)
                    switch result {
                    case .success:
                        sent = "√"
                    case .failure(let error):
                        sent = "X"
                        print(error)
                    }
                }
            }
        }
        .padding()
    }
    
    
    
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
