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
    @State private var singleLlmStatus = false
    @State private var multiLlmStatus = false
    @State private var reverseMouseScrolling = false
    var body: some View {
        Grid{
            GridRow{
                Toggle(isOn: $singleLlmStatus){
                    Text("Create Standalone Single LLM Menu Bar Item")
                }.toggleStyle(.switch)
            }
            GridRow{
                Toggle(isOn: $multiLlmStatus){
                    Text("Create Standalone Multi LLM Menu Bar Item")
                }.toggleStyle(.switch)
                Toggle(isOn: $singleLlmStatus){
                    Text("Activate Reverse Mouse Scrolling")
                }.toggleStyle(.switch)
            }
        }
    }
}

#Preview {
    ConfigureView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
