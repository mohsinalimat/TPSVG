//
//  TPSVGEllipse.swift
//  TPSVG
//
//  Created by Philip Niedertscheider on 30.11.18.
//  Copyright © 2018 techprimate GmbH & Co. KG. All rights reserved.
//

/**
 TODO: Add documentation
 */
class TPSVGEllipse: TPSVGElement {

    /**
     TODO: Add documentation
     */
    public var center: CGPoint

    /**
     TODO: Add documentation
     */
    public var radius: CGVector

    /**
     TODO: Add documentation
     */
    public init(classNames: [String] = [], center: CGPoint = .zero, radius: CGVector = .zero) {
        self.center = center
        self.radius = radius
        super.init(classNames: classNames)
    }

    /**
     TODO: Add documentation
     */
    public override init?(attributes: [String : String]) {
        guard let rawX = attributes["cx"], let x = TPSVGNumberParser.parse(rawX) else {
            return nil
        }
        guard let rawY = attributes["cy"], let y = TPSVGNumberParser.parse(rawY) else {
            return nil
        }
        center = CGPoint(x: x.value, y: y.value)

        guard let rawRadiusY = attributes["rx"], let radiusX = TPSVGNumberParser.parse(rawRadiusY) else {
            return nil
        }
        guard let rawRadiusX = attributes["ry"], let radiusY = TPSVGNumberParser.parse(rawRadiusX) else {
            return nil
        }
        self.radius = CGVector(dx: radiusX.value, dy: radiusY.value)

        super.init(attributes: attributes)
    }

    // MARK: - Equatable

    /**
     TODO: Add documentation
     */
    public static func == (lhs: TPSVGEllipse, rhs: TPSVGEllipse) -> Bool {
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.classNames == rhs.classNames else {
            return false
        }
        guard lhs.center == rhs.center else {
            return false
        }
        guard lhs.radius == rhs.radius else {
            return false
        }
        return true
    }

    // MARK: - Drawing

    /**
     TODO: Add documentation
     */
    override func draw(in context: CGContext) {
        let path = CGMutablePath()
        path.addEllipse(in: CGRect(x: center.x - radius.dx,
                                   y: center.y - radius.dy,
                                   width: 2 * radius.dx,
                                   height: 2 * radius.dy))
        context.addPath(path)
        context.fillPath()
        context.addPath(path)
        context.strokePath()
    }
}
