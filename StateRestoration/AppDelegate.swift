//
//  AppDelegate.swift
//  StateRestoration
//
//  Created by Rob Lokhorst on 13/09/2018.
//  Copyright © 2018 Rob Lokhorst. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = TabBarController()
    window?.makeKeyAndVisible()
    
    return true
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }

  func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
    return true
  }

  func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
    return true
  }
}

