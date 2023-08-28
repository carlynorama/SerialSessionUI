//
//  ContentView.swift
//  SerialSession
//
//  Created by Carlyn Maw on 8/24/23.
//

import SwiftUI
import SerialSession

struct ContentView: View {
    @StateObject var serialSession:SerialSession = SerialSession(devicePath: "/dev/cu.usbmodem1101")
    
    var body: some View {
        TabView {
            WriteView()
            .tabItem {
                Label("Send", systemImage: "tray.and.arrow.up.fill")
            }
            ReadAvailableBytesView()
                .tabItem {
                    Label("Read Bytes", systemImage: "tray.and.arrow.down.fill")
                }
            LineBatchView()
                .tabItem {
                    Label("LineBatch", systemImage: "tray.and.arrow.down.fill")
                }

        }.environmentObject(serialSession)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
