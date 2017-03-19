//
//  User.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import Foundation

/// Interface for User object that describes current user of the app.
public protocol User {

    var resourceId: String { get }
    var age: Double { get }
    var country: String { get }
    var name: String { get }
    var image: UIImage? { get }

}

/// Struct that describes a user that created an account.
public struct RegisteredUser: User {

    public let resourceId: String
    public let age: Double
    public let country: String
    public let name: String
    public let image: UIImage?

    public init(age: Double, country: String, name: String, image: UIImage?) {
        self.age = age
        self.country = country
        self.name = name
        self.image = image
        self.resourceId = UUID().uuidString
    }

}

/// Struct that describes anonymous user.
public struct AnonymousUser: User {

    public var resourceId: String = UUID().uuidString
    public var age: Double = 25
    public var country: String = "USA"
    public var name: String = "Anonymous"
    public var image: UIImage? = nil

}
