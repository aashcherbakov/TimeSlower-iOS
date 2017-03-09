//
//  Environment.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/9/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import Foundation

internal protocol Environment {

    var router: Router { get }

}

internal final class AppEnvironment: Environment {

    let router: Router = AppRouter()

}

/// Router.
internal protocol Router {



}

internal struct AppRouter: Router {

    func reset() {

    }

    func routeToMainScreen() {

    }

    func routeToOnboarding() {

    }

}


