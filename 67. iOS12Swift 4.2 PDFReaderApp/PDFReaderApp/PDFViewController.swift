//
//  PDFViewController.swift
//  PDFReaderApp
//
//  Created by Alexey Efimov on 03/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit
import WebKit

class PDFViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        if let fileName = title {
            openPDFFile(fileName)
        }
    }
    

    private func openPDFFile(_ fileName: String) {
        if let filePath = Bundle.main.url(forResource: fileName, withExtension: "pdf") {
            let request = URLRequest(url: filePath)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }

}
