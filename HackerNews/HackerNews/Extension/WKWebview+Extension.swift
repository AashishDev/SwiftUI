//
//  WKWebview+Extension.swift
//  HackerNews
//
//  Created by Aashish Tyagi on 2/17/22.
//

import Foundation
import WebKit

extension  WKWebView {
    static func pageNotFoundView() -> WKWebView {
        
        let wk = WKWebView()
        wk.loadHTMLString("<html><body><h1>Page not found</h1></body></html>", baseURL: nil)
        return wk
    }
    
}
