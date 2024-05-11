//
//  mainView'.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/24/24.
//

import Foundation
import SwiftUI
import AppKit
struct MainView: View{
    
    @State private var showLLM = false
    @StateObject private var windowManager = WindowManager()
    var body: some View{
        VStack() {
            Button("Open Mac Essentials"){
                windowManager.openConfigureWindow()
            }.padding([.top], 10)
            if(states.singleLlmStatus){
                Button("Ask LLM") {
                    showLLM = true
                }
                .popover(isPresented: $showLLM) {
                    var width:CGFloat = 300
                    var height:CGFloat = 400
                        llmView(width: width, height: height, urlString: "https://www.chatgpt.com").frame(width: width, height: height)
                    
                }
            }
            
            Button("Full Quit (Ends all features)") {
                stopEventTap() //Ends the event tap for reverse mouse scrolling
                NSApplication.shared.terminate(nil)
                
            }.keyboardShortcut("q").padding([.trailing, .leading,.bottom], 10)
            
        }
    }
    
}


class WindowManager: NSObject, ObservableObject {
    @Published var window: NSWindow?
    
    func openConfigureWindow() {
        if window == nil {
            let screen = NSScreen.main?.visibleFrame ?? NSRect(x: 0, y: 0, width: 800, height: 600)
            let windowWidth = screen.width * 0.5
            let windowHeight = screen.height * 0.5
            
            window = NSWindow(
                contentRect: NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight),
                styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                backing: .buffered,
                defer: false
            )
            window?.center()
            window?.contentView = NSHostingView(rootView: ConfigureView())
            window?.makeKeyAndOrderFront(nil)
            window?.isReleasedWhenClosed = false
            window?.delegate = self
        } else {
            window?.makeKeyAndOrderFront(nil)
        }
    }
    
    func closeWindow() {
        window = nil
    }
}

extension WindowManager: NSWindowDelegate {
    func windowWillClose(_ notification: Notification) {
        closeWindow()
    }
}

#Preview {
    MainView()
}
