//
//  ConfigureView.swift
//  MacEssentials
//
//  Created by Krish Meghani on 5/4/24.
//
//

import SwiftUI
import CoreData

struct ConfigureView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var singleLlmStatus = UserDefaults.standard.bool(forKey: "singleLlmStatus")
    @State private var multiLlmStatus = UserDefaults.standard.bool(forKey: "multiLlmStatus")
    @State private var reverseMouseScrolling = UserDefaults.standard.bool(forKey: "reverseMouseScrolling")
    var body: some View {
        Grid{
            GridRow{
                Toggle(isOn: $singleLlmStatus){
                    Text("Create Standalone Single LLM Menu Bar Item")
                }.toggleStyle(.switch)
                    .onChange(of: singleLlmStatus){oldVal, newVal in
                        UserDefaults.standard.set(newVal, forKey: "singleLlmStatus")
                        states.update()
                        NSLog(String(states.singleLlmStatus))
                    }
            }
            GridRow{
                Toggle(isOn: $multiLlmStatus){
                    Text("Create Standalone Multi LLM Menu Bar Item")
                }.toggleStyle(.switch)
                    .onChange(of: multiLlmStatus){oldVal, newVal in
                        UserDefaults.standard.set(newVal, forKey: "multiLlmStatus")
                        states.update()
                    }
                Toggle(isOn: $reverseMouseScrolling){
                    Text("Reverse only mouse scrolling")
                }.toggleStyle(.switch)
                    .onChange(of: reverseMouseScrolling){oldVal, newVal in
                        UserDefaults.standard.set(newVal, forKey: "reverseMouseScrolling")
                        states.update()
                        manageEventTap(activated: newVal)
                    }
            }
        }
    }
}


#Preview {
    ConfigureView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
