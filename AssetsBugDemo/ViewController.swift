//
//  ViewController.swift
//  AssetsBugDemo
//
//  Created by Y. Yılmaz Erdoğmuş on 13.01.2025.
//

import UIKit
import AmaniUI
import AmaniSDK

class ViewController: UIViewController {
  let amaniUI = AmaniUI.sharedInstance

  
  override func viewDidLoad() {
    super.viewDidLoad()
    amaniUI.setDelegate(delegate: self)
    
    amaniUI.set(server: "SERVER", token:"TOKEN", language: "tr", apiVersion: .v2)
    
    amaniUI.showSDK(on: self) {[weak self](customer, error) in
      if let error = error {
        fatalError(error.localizedDescription)
      } else {
        self?.amaniUI.showSDK(on: self!) {[weak self](customer, error) in
          if let error = error {
            fatalError(error.localizedDescription)
          } else {
            print(customer)
          }
        }
      }
    }
  }
  
}
extension ViewController: AmaniUIDelegate{
  
  func onError(type: String, Error: [AmaniSDK.AmaniError]) {
    print(type, Error)
  }
  
  func onKYCSuccess(CustomerId: String) {
    print("onKYCSuccess", CustomerId)
  }
  
  func onKYCFailed(CustomerId: String, Rules: [[String : String]]?) {
    print("onKYCFailed", CustomerId, Rules)
  }
}
