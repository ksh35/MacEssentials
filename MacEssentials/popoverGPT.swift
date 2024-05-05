//
//  popoverGPT.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/16/24.
//

import Foundation
import SwiftUI

struct gptView: View {

    var body: some View {
        WebView(url: URL(string: "https://www.meta.ai")!)
            .frame(minWidth: 300, minHeight: 400)
    }
}
