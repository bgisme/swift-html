# SwiftHtml

An awesome Swift HTML DSL library using result builders.

```swift
let doc = Document {
    Html {
        Head {
            Title("Hello Swift DSL")
            
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
                        P("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla pretium leo eu euismod porta.")
                            .class(["green", "blue"])
                            .spellcheck(false)
                    }
                    A("Hello Swift HTML DSL!")
                        .href("https://swift.org")
                        .target(.blank)
                        .download()
                    Abbr("WHO")
                        .title("World Health Organization")
                }
            }
            .class("container")

            Script()
                .src("./javascript/main.js")
        }
    }
}
print(doc.html)
```

## Credits & references

- [HTML Reference](https://www.w3schools.com/tags/default.asp)
