//
//  Router.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import UIKit

/// Router.
internal protocol Router {

    /// Starts navigation stack in given Window instance. Injects builder instance. Must be called when application starts.
    ///
    /// - Parameters:
    ///   - window: UIWindow.
    ///   - builder: ViewControllerBuilder.
    func start(in window: UIWindow?, builder: ViewControllerBuilder)


    /// Resets starting controller in RootViewController view.
    func reset()

    /// Pushes or presents (depending on style) controller for specified destination.
    ///
    /// - Parameters:
    ///   - destination: Destination in the app.
    ///   - style: PresentationStyle.
    func route(to destination: Destination, style: PresentationStyle)

}

// MARK: - Router

extension AppRouter: Router {

    func start(in window: UIWindow?, builder: ViewControllerBuilder) {
        self.window = window
        self.builder = builder
        reset()
    }

    func reset() {
        let start = startingDestination()
        startNavigation(from: start)
    }

    func route(to destination: Destination, style: PresentationStyle) {
        let destinationController = builder.buildController(for: destination)
        return route(to: destinationController, style: style)
    }
    
}

/// Main application router.
internal final class AppRouter {

    fileprivate var builder: ViewControllerBuilder!
    fileprivate var window: UIWindow?


    // MARK: - Private functions

    fileprivate func startingDestination() -> Destination {
        return .editActivity
    }

    fileprivate func startNavigation(from destination: Destination) {
        guard let rootViewController = window?.rootViewController as? RootViewController else {
            return
        }

        let startingController = builder.buildController(for: destination)
        rootViewController.display(startingController)
    }

    fileprivate func route(to viewController: UIViewController, style: PresentationStyle) {
        switch style {
        case .push(let navigationController):
            navigationController?.pushViewController(viewController, animated: true)
        case .present(let presenter):
            presenter?.present(viewController, animated: true, completion: nil)
        }

    }
    
}
