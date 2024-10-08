# SwiftHtml

An awesome Swift HTML DSL library using result builders.

```swift
import SwiftHtml 

let doc = Document(.html) {
    Html {
        Head {
            Title("Hello Swift HTML DSL")
            
            Meta().charset("utf-8")
            Meta().name(.viewport).content("width=device-width, initial-scale=1")

            Link(rel: .stylesheet).href("./css/style.css")
        }
        Body {
            Main {
                Div {
                    Section {
                        Img(src: "./images/swift.png", alt: "Swift Logo")
                            .title("Picture of the Swift Logo")
                        H1("Lorem ipsum")
                            .class("red")
                        P("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                            .class(["green", "blue"])
                            .spellcheck(false)
                    }

                    A("Download SwiftHtml now!")
                        .href("https://github.com/binarybirds/swift-html/")
                        .target(.blank)
                        .download()
                        
                    Abbr("WTFPL")
                        .title("Do What The Fuck You Want To Public License")
                }
            }
            .class("container")

            Script().src("./js/main.js").async()
        }
    }
}

let html = DocumentRenderer(minify: false, indent: 2).render(doc)
print(html)
```


## Install

You can simply use `SwiftHtml` as a dependency via the Swift Package Manager:

```swift
.package(url: "https://github.com/binarybirds/swift-html", from: "1.6.0"),
```

Add the `SwiftHtml` product from the `swift-html` package as a dependency to your target:

```swift
.product(name: "SwiftHtml", package: "swift-html"),
```

Import the framework:

```swift
import SwiftHtml
```

That's it.


## Creating custom tags

You can define your own custom tags a few different ways, from simple to complex cases.

1. Subclass `Tag` and it will render with your class name lowercased.

```swift
class MyTag: Tag { }

// <mytag></mytag>
```

2. Subclass `Tag` and override the `name` property.

```swift
class MyTag: Tag { 

    override open class var name: String { "myTag" }
}

// <myTag></myTag>
```

3. Subclass `Tag` and override the `type` property. `Type` determines how your class will render. For example, to create an empty tag...

```swift
class MyTag: Tag {
    
    override open class var type: `Type` { .empty }
}

// <myTag>
```

4. Subclass `Tag`, create your own custom initializer and then call the `Tag` designated initializer.

```swift
class MyTag: Tag {

    init(myAttributeValue: String, @TagBuilder _ builder: () -> Tag) {
        let attribute = .init(key: "myKey", value: myAttributeValue)
        super.init(type: .empty,
                   name: "myTag",
                   attributes: [attribute],
                   builder: [builder()]
        )
    }
}

// <myTag myKey="myAttributeValue">
```

It is also possible to create tags with altered content or default attributes.

```swift
open class Description: Tag {
    
    public init(_ contents: String) {
        super.init()
        setContents("<![CDATA[" + contents + "]]>")
    }
}
// <description><![CDATA[lorem ipsum]]></description> - content wrapped in CDATA

open class Rss: Tag {
    
    public init(@TagBuilder _ builder: () -> Tag) {
        super.init(builder())
        setAttributes([
            .init(key: "version", value: "2.0"),
        ])
    }
}
// <rss version="2.0">...</rss> - tag with a default attribute
```

To customize tags of a particular `Node` type...

```swift
// Bracketed tags... <tagname></tagname> ...use StandardTag class
class MyClass: StandardTag { }

// Single tag... <tagname> ...use EmptyTag class
class MyClass: EmptyTag { }

// Comment tag... <!-- your comments here --> ...use CommentTag class
class MyClass: CommentTag { }
```

When you need to combined multiple tags into one, but don't want the container to render, use the `GroupTag`. This class is especially handy when a function parameter requires one `Tag` but you need to supply many.

```swift
class MyTag: Tag {

    init(myAttributeValue: String, @TagBuilder _ builder: () -> Tag) {
        let attribute = .init(key: "myKey", value: myAttributeValue)
        let node = Node(type: .empty, name: "myTag", attributes: [attribute])
        super.init(node: node, [builder()])
    }
    
    convenience init(anotherValue: String) {
        self.init(myAttributeValue: anotherValue) {
            // must return one Tag for builder parameter
            // use GroupTag because it will not render 
            GroupTag {
                TagA()
                TagB()
                TagC()
            }
        }
    }
}

//  <taga></taga>
//  <tagb></tagb>
//  <tagc></tagc>
```

If you just need to render basic HTML — `<div>`, `<p>`, `<a>`, etc. — then use one the many pre-made classes in the library called by the same name.

## Attribute management

You can set, add or delete the attributes of a given tag.

```swift
Leaf("example")
    // set (override) the current attributes
    .setAttributes([
        .init(key: "a", value: "foo"),
        .init(key: "b", value: "bar"),
        .init(key: "c", value: "baz"),
    ])
    // add a new attribute using a key & value 
    .attribute("foo", "example")
    // add a new flag attribute (without a value)
    .flagAttribute("bar")
    // delete an attribute by using a key
    .deleteAttribute("b")
    
// <leaf a="foo" c="baz" foo="example" bar></leaf>
```

You can also manage the class atrribute through helper methods.

```swift
Span("foo")
    // set (override) class values 
    .class("a", "b", "c")
    // add new class values   
    .class(add: ["d", "e", "f"])
    // add new class value if the condition is true
    .class(add: "b", true)
    /// remove multiple class values
    .class(remove: ["b", "c", "d"])
    /// remove a class value if the condition is true
    .class(remove: "e", true)

// <span class="a f"></span>
```

You can create your own attribute modifier via an extension.

```swift
public extension Guid {
    
    func isPermalink(_ value: Bool = true) -> Self {
        attribute("isPermalink", String(value))
    }
}
```

There are other built-in type-safe attribute modifiers available on tags.


## Composing tags

You can come up with your own `Tag` composition system by introducing a new protocol.

```swift
protocol TagRepresentable {

    @TagBuilder
    func build() -> Tag
}

struct ListComponent: TagRepresentable {

    let items: [String]
    
    init(_ items: [String]) {
        self.items = items
    }

    func build() -> Tag {
        Ul {
            for item in items {
                Li(item)
            }
        }
    }
}

let tag = ListComponent(["a", "b", "c"]).build()
```

This way it is also possible to extend the `TagBuilder` to support the new protocol.

```swift
extension TagBuilder {

    static func buildExpression(_ expression: Tag) -> Tag {
        expression
    }
    
    static func buildExpression(_ expression: TagRepresentable) -> Tag {
        expression.build()
    }
}
```

Sometimes you'll need extra parameters for the build function, so you have to call the build method by hand.

In those cases it is recommended to introduce a `render` function instead of using build.

```swift

let tag = WebIndexTemplate(ctx) {
    ListComponent(["a", "b", "c"])
        .render(req)
}
.render(req)
```

If you want to create a lightweight template engine for the [Vapor](https://vapor.codes/) web framework using SwiftHtml, you can see a working example inside the [Feather CMS core](https://github.com/FeatherCMS/feather-core) repository. 


## Credits & references

- [HTML Reference](https://www.w3schools.com/tags/default.asp)
