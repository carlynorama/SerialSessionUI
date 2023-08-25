//
//  ContentView.swift
//  SerialSession
//
//  Created by Carlyn Maw on 8/24/23.
//

import SwiftUI
import SerialSession



struct ContentView: View {
//    @State var echoTest:EchoTest = EchoTest(portName: "/dev/cu.usbmodem1101")
    @StateObject var serialWriter:SerialSession = SerialSession(portName: "/dev/cu.usbmodem1201")
    
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
        .onAppear() {
            serialWriter.pingII()
            //echoTest.run()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
