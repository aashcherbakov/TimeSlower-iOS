//
//  RootViewController.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/9/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import UIKit

internal final class RootViewController: UIViewController {

    private(set) var currentViewController: UIViewController?

    func display(_ viewController: UIViewController) {
        let oldViewController = currentViewController
        let newViewController = viewController

        // Set currentViewController so that we can animate the status bar appearance.
        currentViewController = newViewController

        // Force load the view about to be presented.
        _ = newViewController.view

        addChildViewController(newViewController)
        oldViewController?.willMove(toParentViewController: nil)

        if let oldViewController = oldViewController {
            if oldViewController.presentedViewController != nil {
                oldViewController.dismiss(animated: true, completion: nil)
            }

            transition(
                from: oldViewController,
                to: newViewController,
                duration: Constants.Animations.defaultCrossDissolveAnimationDuration,
                options: .transitionCrossDissolve,
                animations: {
                    self.setNeedsStatusBarAppearanceUpdate()
            },
                completion: { (_) in
                    oldViewController.view.removeFromSuperview()
                    oldViewController.removeFromParentViewController()
            }
            )
        } else {
            view.setNeedsLayout()
            view.layoutIfNeeded()
            view.addSubview(newViewController.view)
        }
    }

}
