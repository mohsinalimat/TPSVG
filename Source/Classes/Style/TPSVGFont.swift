//
//  TPSVGFont.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: documentation
 */
public struct TPSVGFont {

    /**
     TODO: documentation
     */
    public var family: String?

    /**
     TODO: documentation
     */
    public var size: CGFloat?

    /**
     TODO: documentation
     */
    public init(family: String? = nil, size: CGFloat? = nil) {
        self.family = family
        self.size = size
    }
}
