//
//  Comment.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

/// The comment tag is used to insert comments in the source code.
///
/// `<!-- example comment -->`
///
/// Comments are not displayed in the browsers.
/// You can use comments to explain your code, which can help you when you edit the source code at a later date.
/// This is especially useful if you have a lot of code.
open class Comment: CommentTag {
    
    override open class var name: String { .init(describing: Comment.self).lowercased() }
    
    public init(_ contents: String) {
        super.init()
        setContents(contents)
    }
}
