//
//  TypedTag.swift
//  
//
//  Created by Brad Gourley on 7/12/23.
//

// Unifies init code for all superclasses of a particular Tag Kind

open class TagKind: Tag {
    
    public init(name: String? = nil,
                contents: String? = nil,
                attributes: [Attribute]? = nil,
                _ children: [Tag]? = nil) {
        super.init(name: name,
                   contents: contents,
                   attributes: attributes,
                   children)
    }
    
    public convenience init(name: String? = nil,
                            contents: String? = nil,
                            attributes: [Attribute]? = nil,
                            _ child: Tag) {
        self.init(name: name,
                  contents: contents,
                  attributes: attributes,
                  [child])
    }
    
    public convenience init(name: String? = nil,
                contents: String? = nil,
                attributes: [Attribute]? = nil,
                @TagBuilder _ builder: () -> Tag) {
        self.init(name: name,
                  contents: contents,
                  attributes: attributes,
                  [builder()])
    }
    
    public convenience init(_ contents: String) {
        self.init(contents: contents)
    }
}

