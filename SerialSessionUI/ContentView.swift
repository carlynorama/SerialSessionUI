//
//  ContentView.swift
//  SerialSession
//
//  Created by Carlyn Maw on 8/24/23.
//

import SwiftUI
import SerialSession



struct ContentView: View {
    @StateObject var serialSession:SerialSession = SerialSession(portName: "/dev/cu.usbmodem1101")
    
    var body: some View {
        TabView {
            ReadView()
            WriteView()
        }.environmentObject(serialSession)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
