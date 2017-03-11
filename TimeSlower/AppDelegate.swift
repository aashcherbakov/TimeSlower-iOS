//
//  AppDelegate.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/9/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var environment: Environment!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        environment = AppEnvironment()
        environment.run(in: window)
        return true
    }

}
