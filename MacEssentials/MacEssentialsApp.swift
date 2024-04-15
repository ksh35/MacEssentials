//
//  MacEssentialsApp.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/2/24.
//

import SwiftUI

@main
struct MacEssentialsApp: App {
    let persistenceController = PersistenceController.shared
    @State var reverseMouseScroll: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }

        @State var currentNumber: String = "1"
        var volumeMixerWindow: NSWindow? = nil
        MenuBarExtra(currentNumber, systemImage: "\(currentNumber).circle") {
            Button("Open Volume Mixer") {
                currentNumber = "1"
                if volumeMixerWindow == nil{
                    volumeMixerWindow = NSWindow(
                            contentRect: NSRect(x: 20, y: 20, width: 480, height: 300),
                            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                            backing: .buffered, defer: false)
                        volumeMixerWindow?.center()
                        volumeMixerWindow?.isReleasedWhenClosed = false
                        volumeMixerWindow?.setFrameAutosaveName("Volume Mixer")
                        volumeMixerWindow?.contentView = NSHostingView(rootView: VolumeMixerView())
                }
                volumeMixerWindow?.makeKeyAndOrderFront(nil)
                volumeMixerWindow?.orderFrontRegardless()
            }
            .keyboardShortcut("1")

            Button("Reverse Mouse Scrolling") {
                if(!reverseMouseScroll){
                    if(startEventTap()){
                        NSLog("True")
                        reverseMouseScroll.toggle()
                    }
                }else{
                    stopEventTap()
                    reverseMouseScroll.toggle()
                    NSLog("False")
                }
                
            }
            .keyboardShortcut("2")

            Button("Three") {
                currentNumber = "3"
            }
            .keyboardShortcut("3")
            Divider()
            Button("Quit") {
                stopEventTap()
                NSApplication.shared.terminate(nil)
                    
            }.keyboardShortcut("q")

        }

    }
}
