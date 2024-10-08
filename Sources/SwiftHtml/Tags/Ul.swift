//
//  Ul.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

/// The `<ul>` tag defines an unordered (bulleted) list.
/// 
/// Use the `<ul>` tag together with the `<li>` tag to create unordered lists.
/// 
/// **Tip:** Use CSS to style lists.
/// 
/// **Tip:** For ordered lists, use the `<ol>` tag.
open class Ul: StandardTag {
    
    override open class var name: String { .init(describing: Ul.self).lowercased() }
}
