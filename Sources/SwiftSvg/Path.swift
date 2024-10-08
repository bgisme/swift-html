//
//  Path.swift
//  SwiftSvg
//
//  Created by Tibor Bodecs on 2021. 12. 21..
//


/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/path
open class Path: StandardTag {
    
    override open class var name: String { .init(describing: Path.self).lowercased() }

    public init(_ d: String, pathLength: Double? = nil) {
        super.init()
        setAttributes([
            .init(key: "d", value: d),
        ])
        attribute("pathLength", pathLength?.preciseString)
    }
}
