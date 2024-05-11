//
//  browser.swift
//  MacEssentials
//
//  Created by Krish Meghani on 5/1/24.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {
    let url: URL
    
    func makeNSView(context: Context) -> WKWebView {
        
        let configuration = WKWebViewConfiguration()
        configuration.websiteDataStore = WKWebsiteDataStore.default()
        return WKWebView(frame: .zero, configuration: configuration)
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        if nsView.url != self.url {
            let request = URLRequest(url: self.url)
            nsView.load(request)
        }
    }
}


