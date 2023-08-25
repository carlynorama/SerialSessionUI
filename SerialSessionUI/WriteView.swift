//
//  WriteView.swift
//  SerialSessionUI
//
//  Created by Carlyn Maw on 8/25/23.
//

import SwiftUI
import SerialSession

struct WriteView: View {
    @EnvironmentObject var serialWriter:SimpleSerialSession
    
        @State var brightness:Double = 0.5
        var body: some View {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Slider(value: $brightness) { editing in
                    if !editing {
                        let val = UInt8(brightness * 255)
                        print(val)
                        serialWriter.sendByte(val)
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
