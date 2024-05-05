//
//  mainView'.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/24/24.
//

import Foundation
import SwiftUI

struct MainView: View{
    @State var reverseMouseScroll: Bool = false
    @State private var showGPT = false
    var body: some View{
        var volumeMixerWindow: NSWindow? = nil
        VStack() {
            
            Button("Open Volume Mixer") {
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
            .keyboardShortcut("1").padding([.top], 10)
            
            
            Button(reverseMouseScrollText(reverseMouseScroll: reverseMouseScroll)) {
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
            
            Button("Ask GPT") {
                showGPT = true
            }
            .popover(isPresented: $showGPT) {
                gptView().frame(width: 400, height: 500)
                
            }.keyboardShortcut("3")
            Divider()
            Button("Quit") {
                stopEventTap()
                NSApplication.shared.terminate(nil)
                
            }.keyboardShortcut("q")
            
        }
    }
    private func reverseMouseScrollText(reverseMouseScroll: Bool) -> String{
        if(reverseMouseScroll){
            return "Deactivate Reverse Mouse Scrolling"
        }else{
            return "Activate Reverse Mouse Scrolling"
        }
    }
}
#Preview {
    MainView()
}
