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
        return WKWebView()
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        let request = URLRequest(url: self.url)
        nsView.load(request)
    }
}

