//
//  Output.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 23..
//

/// The `<output>` tag is used to represent the result of a calculation (like one performed by a script).
open class Output: StandardTag {
    
    override open class var name: String { .init(describing: Output.self).lowercased() }
}

public extension Output {
    
    /// Specifies the relationship between the result of the calculation, and the elements used in the calculation
    func `for`(_ value: String) -> Self {
        attribute("for", value)
    }
    
    /// Specifies which form the output element belongs to
    func form(_ value: String) -> Self {
        attribute("form", value)
    }
    
    /// Specifies a name for the output element
    func name(_ value: String) -> Self {
        attribute("name", value)
    }
}
