//
//  MacEssentialsApp.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/2/24.
//

import SwiftUI
@main
struct MacEssentialsApp: App {
    //let persistenceController = PersistenceController.shared
    
    
    init(){
        let reverseMouse:Bool = UserDefaults.standard.bool(forKey: "reverseMouseScrolling")
        manageEventTap(activated: reverseMouse)
        
    }
    
    var body: some Scene {
        // WindowGroup {
        //     ConfigureView()
        //         .environment(\.managedObjectContext, persistenceController.container.viewContext)
        // }
        
        MenuBarExtra("main", image: "Logo") {
            MainView()
        }.menuBarExtraStyle(.window)
        

    }
}
class states: ObservableObject {
    
    static public var singleLlmStatus = UserDefaults.standard.bool(forKey: "singleLlmStatus")
    static public var multiLlmStatus = UserDefaults.standard.bool(forKey: "multiLlmStatus")
    static public var reverseMouseScrolling = UserDefaults.standard.bool(forKey: "reverseMouseScrolling")
    
    static public func update() {
        singleLlmStatus = UserDefaults.standard.bool(forKey: "singleLlmStatus")
        multiLlmStatus = UserDefaults.standard.bool(forKey: "multiLlmStatus")
        reverseMouseScrolling = UserDefaults.standard.bool(forKey: "reverseMouseScrolling")
    }
        
}
public func manageEventTap(activated:Bool){
    if activated{
        startEventTap()
    }else{
        stopEventTap()
    }
}


