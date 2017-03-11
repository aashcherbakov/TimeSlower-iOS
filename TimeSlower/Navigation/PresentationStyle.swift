//
//  PresentationStyle.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import UIKit

/// Presentation style.
///
/// - push: Push on navigation stack.
/// - present: Present modally.
internal enum PresentationStyle {

    case push(navigationController: UINavigationController?)
    case present(presenter: UIViewController?)

}
