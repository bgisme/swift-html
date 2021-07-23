//
//  Footer.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

public extension Node {

    static func footer(_ children: [Node] = []) -> Node {
        Node(type: .standard, name: "footer", children: children)
    }
}

/// The `<footer>` tag defines a footer for a document or section.
///
/// A `<footer>` element typically contains:
///
/// - authorship information
/// - copyright information
/// - contact information
/// - sitemap
/// - back to top links
/// - related documents
/// You can have several `<footer>` elements in one document.
public struct Footer: Tag {
    public var node: Node

    public init(_ node: Node) {
        self.node = node
    }
    
    public init(_ children: [Node] = []) {
        self.node = .footer(children)
    }

    public init(@TagBuilder _ builder: () -> [Tag]) {
        self.init(builder().map(\.node))
    }
}
