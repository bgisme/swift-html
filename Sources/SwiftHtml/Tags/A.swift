//
//  A.swift
//  SwiftHtml
//
//  Created by Tibor Bodecs on 2021. 07. 19..
//

/// The `<a>` tag defines a hyperlink, which is used to link from one page to another.
///
/// The most important attribute of the `<a>` element is the href attribute, which indicates the link's destination.
///
/// By default, links will appear as follows in all browsers:
///
/// - An unvisited link is underlined and blue
/// - A visited link is underlined and purple
/// - An active link is underlined and red
open class A: StandardTag {
    
    override open class var name: String { .init(describing: A.self).lowercased() }
}

public extension A {
    
    enum Rel: String {
        /// Provides a link to an alternate representation of the document (i.e. print page, translated or mirror)
        case alternate
        /// Provides a link to the author of the document
        case author
        /// Permanent URL used for bookmarking
        case bookmark
        /// Indicates that the referenced document is not part of the same site as the current document
        case external
        /// Provides a link to a help document
        case help
        /// Provides a link to licensing information for the document
        case license
        /// Provides a link to the next document in the series
        case next
        /// Links to an unendorsed document, like a paid link.
        /// ("nofollow" is used by Google, to specify that the Google search spider should not follow that link)
        case nofollow
        /// Requires that any browsing context created by following the hyperlink must not have an opener browsing context
        case noopener
        /// Makes the referrer unknown. No referer header will be included when the user clicks the hyperlink
        case noreferrer
        /// The previous document in a selection
        case prev
        /// Links to a search tool for the document
        case search
        /// A tag (keyword) for the current document
        case tag
    }
    
    /// Specifies that the target will be downloaded when a user clicks on the hyperlink
    @discardableResult
    func download(_ value: String? = nil, _ condition: Bool = true) -> Self {
        flagAttribute("download", value, condition)
    }
    
    /// Specifies the URL of the page the link goes to
    @discardableResult
    func href(_ value: String?, _ condition: Bool = true) -> Self {
        attribute("href", value, condition)
    }
    
    /// Specifies the language of the linked document
    @discardableResult
    func hreflang(_ value: String?, _ condition: Bool = true) -> Self {
        attribute("hreflang", value, condition)
    }
    
    /// Specifies what media/device the linked document is optimized for
    @discardableResult
    func media(_ value: String?, _ condition: Bool = true) -> Self {
        attribute("media", value, condition)
    }
    
    /// Specifies what media/device the linked document is optimized for
    ///
    /// If multiple queries were provided they're going to be concatenated with an `and` operand
    @discardableResult
    func media(_ queries: MediaQuery...) -> Self {
        return media(queries)
    }
    
    /// Specifies what media/device the linked document is optimized for
    ///
    /// If multiple queries were provided they're going to be concatenated with an `and` operand
    @discardableResult
    func media(_ queries: [MediaQuery]?, _ condition: Bool = true) -> Self {
        return media(queries?.map(\.value).joined(separator: " and "), condition)
    }
    
    /// Specifies a space-separated list of URLs to which, when the link is followed, post requests with the body ping will be sent by the browser (in the background).
    ///
    /// Typically used for tracking.
    @discardableResult
    func ping(_ value: [String]?, _ condition: Bool = true) -> Self {
        attribute("ping", value?.joined(separator: " "), condition)
    }
    
    /// Specifies which referrer information to send with the link
    @discardableResult
    func refererPolicy(_ value: RefererPolicy? = .origin, _ condition: Bool = true) -> Self {
        attribute("referrerpolicy", value?.rawValue, condition)
    }
    
    /// Specifies the relationship between the current document and the linked document
    @discardableResult
    func rel(_ value: Rel?, _ condition: Bool = true) -> Self {
        attribute("rel", value?.rawValue, condition)
    }

    /// Specifies where to open the linked document
    @discardableResult
    func target(_ value: TargetFrame?, _ condition: Bool = true) -> Self {
        attribute("target", value?.rawValue, condition)
    }
    
    /// The type attribute specifies the Internet media type (formerly known as MIME type) of the linked document.
    @discardableResult
    func type(_ value: String?, _ condition: Bool = true) -> Self {
        attribute("type", value, condition)
    }
}
