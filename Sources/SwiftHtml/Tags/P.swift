//
//  P.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

/// The `<p>` tag defines a paragraph.
/// 
/// Browsers automatically add a single blank line before and after each `<p>` element.
/// 
/// **Tip:** Use CSS to style paragraphs.
open class P: StandardTag {
    
    override open class var name: String { .init(describing: P.self).lowercased() }
}
