//
//  ViewControllerFactory.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import UIKit

/// Protocol that unites UIViewControllers and alows to use generics for creation
protocol StoryboardInstantiatable {
}

/**
 *  Struct that alows simple creation of controllers using generics
 */
internal struct ViewControllerFactory {

    private enum Storyboard: String {
        case main = "Main"
        case activity = "Activity"

        init?<T>(for type: T) {
            switch type {
            case is ActivityListViewController.Type: self = .main
            case is CreateActivityViewController.Type: self = .activity
            default: return nil
            }
        }

        func instance() -> UIStoryboard {
            return UIStoryboard(name: self.rawValue, bundle: nil)
        }
    }

    /**
     Creates controller of specified type from appropriate storyboard

     - returns: controller of specified type
     */
    func create<T: StoryboardInstantiatable>() -> T {
        guard let storyboard = Storyboard(for: T.self) else {
            fatalError("Controller \(String(describing: T.self)) should be instantiated")
        }

        guard let controller = storyboard
            .instance()
            .instantiateViewController(withIdentifier: String(describing: T.self)) as? T
        else {
            fatalError("Controller \(String(describing: T.self)) should be instantiated")
        }

        return controller
    }

}
