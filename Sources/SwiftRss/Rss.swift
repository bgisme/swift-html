//
//  Rss.swift
//  SwiftRss
//
//  Created by Tibor Bodecs on 2021. 12. 19..
//

// https://validator.w3.org/feed/docs/rss2.html#ltttlgtSubelementOfLtchannelgt
open class Rss: StandardTag {
    
    override open class var name: String { .init(Rss.self) }
    
    public init(@TagBuilder _ builder: () -> TagRepresentable) {
        super.init([builder()])
        setAttributes([
            .init(key: "version", value: "2.0"),
//            .init(key: "xmlns:atom", value: "http://www.w3.org/2005/Atom"),
        ])
    }
}
