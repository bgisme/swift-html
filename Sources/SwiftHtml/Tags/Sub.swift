//
//  Sub.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

/// The `<sub>` tag defines subscript text.
///
/// Subscript text appears half a character below the normal line, and is sometimes rendered in a smaller font.
/// Subscript text can be used for chemical formulas, like H2O.
///
/// **Tip:** Use the `<sup>` tag to define superscripted text.
open class Sub: StandardTag {
    
    override open class var name: String { .init(describing: Sub.self).lowercased() }
}
