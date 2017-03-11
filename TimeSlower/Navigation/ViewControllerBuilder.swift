//
//  ViewControllerBuilder.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import UIKit

/// Instance responsible for creating view controllers and injecting dependencies into them.
internal protocol ViewControllerBuilder {

    /// Creates and builds controller for provided destination.
    ///
    /// - Parameter destination: Destionation enum value.
    /// - Returns: UIViewController instance.
    func buildController(for destination: Destination) -> UIViewController

}

/// Main view controller builder.
internal struct AppViewControllerBuilder: ViewControllerBuilder {

    private let factory = ViewControllerFactory()

    func buildController(for destination: Destination) -> UIViewController {
        switch destination {
        case .activityList:
            return buildActivityList()
        case .editActivity:
            return buildCreateActivity()
        }
    }

    // MARK: - Private functions

    private func buildActivityList() -> ActivityListViewController {
        let controller: ActivityListViewController = factory.create()
        return controller
    }

    private func buildCreateActivity() -> CreateActivityViewController {
        let controller: CreateActivityViewController = factory.create()
        return controller
    }

}
