//
//  popoverGPT.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/16/24.
//

import Foundation
import SwiftUI

struct llmView: View {
    var width:CGFloat
    var height:CGFloat
    var urlString:String
    var body: some View {
        WebView(url: URL(string: urlString)!)
            .frame(minWidth: 300, minHeight: 400)
    }
}

