//
//  Counter.swift
//  NativeModules
//
//  Created by Srikanth Sharma on 09/04/20.
//

import Foundation

@objc(Counter)
class Counter: NSObject {
  @objc static var count = 0
  @objc static func requiresMainQueueSetup () -> Bool {
    return true
  }
  @objc func getCount(_ callback: RCTResponseSenderBlock) {
    callback([NSNull(), Counter.count])
  }
  @objc func increment() {
    Counter.count += 1;
    print("Counter is \(Counter.count)")
  }
}
