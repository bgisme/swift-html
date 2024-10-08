//
//  Option.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

/// The `<option>` tag defines an option in a select list.
/// 
/// `<option>` elements go inside a `<select>`, `<optgroup>`, or `<datalist>` element.
/// 
/// **Note:** The `<option>` tag can be used without any attributes, but you usually need the value attribute, which indicates what is sent to the server on form submission.
/// 
/// **Tip:** If you have a long list of options, you can group related options within the `<optgroup>` tag.
open class Option: StandardTag {
    
    override open class var name: String { .init(describing: Option.self).lowercased() }
}

public extension Option {
    /// Specifies that an option should be disabled
    @discardableResult
    func disabled(_ condition: Bool = true) -> Self {
        flagAttribute("disabled", nil, condition)
    }
    
    /// Specifies a shorter label for an option
    @discardableResult
    func label(_ value: String?, _ condition: Bool = true) -> Self {
        attribute("label", value, condition)
    }
    
    /// Specifies that an option should be pre-selected when the page loads
    @discardableResult
    func selected(_ condition: Bool = true) -> Self {
        flagAttribute("selected", nil, condition)
    }
    
    /// Specifies the value to be sent to a server
    @discardableResult
    func value(_ value: String?, _ condition: Bool = true) -> Self {
        attribute("value", value, condition)
    }
}
