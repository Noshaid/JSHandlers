//
//  ViewController.swift
//  JSHandlers
//
//  Created by Noshaid Ali on 26/01/2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webview: WKWebView!
    let subscriptionSuccess = "subscriptionSuccess"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let config = WKWebViewConfiguration()
        config.userContentController.add(self, name: subscriptionSuccess)
        let rect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        webview = WKWebView(frame: rect, configuration: config)
        self.view.addSubview(webview)
    }

    override func viewWillAppear(_ animated: Bool) {
//        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
//            let request = URLRequest(url: url)
//            webview.load(request)
//        }
        
        let url = URL(string: "https://www.cricwick.net")!
        let request = URLRequest(url: url)
        webview.load(request)
        
    }

}

extension ViewController: WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == subscriptionSuccess {
            guard let dict = message.body as? [String: AnyObject] else {
                return
            }
            print("1. \(String(describing: dict["msdin"]))")
            print("2. \(String(describing: dict["success"]))")
        }
    }
}

