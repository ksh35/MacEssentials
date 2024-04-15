//
//  VolumeMixerView.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/3/24.
//

import SwiftUI

struct VolumeMixerView: View {
    @State var appVolumes: [String: Double] = ["Safari": 0.5, "Spotify": 0.8]
    @State var activeMixer: Bool = false
        
        var body: some View {
            VStack {
                Text("Volume Mixer").font(.headline)
                Toggle("Activate Mixer", isOn: $activeMixer).toggleStyle(.switch)
                if(activeMixer){
                    
                }
                List(appVolumes.keys.sorted(), id: \.self) { appName in
                    HStack {
                        Text(appName)
                        Slider(value: Binding(
                            get: { self.appVolumes[appName] ?? 0.5 },
                            set: { newValue in
                                self.appVolumes[appName] = newValue
                                // volume adjustme here
                            }
                        ), in: 0...1)
                        
                    }
                }
            }
        }
}

#Preview {
    VolumeMixerView()
}
