public func align(
    left: String,
    right: String,
    width: Int = 80,
    char: String = " ",
    spaceBetween: Int = 10
) -> String {
    let total = left.count + right.count
    let effectiveWidth = total > width ? total + spaceBetween : width
    let middle = max(0, effectiveWidth - total)
    let fill = String(repeating: char, count: middle)
    return left + fill + right
}

public func alignPairs(
    pairs: [(String, String)],
    spaceBetween: Int = 10,
    char: String = " "
) -> [String] {
    let width = optimalWidth(for: pairs, spaceBetween: spaceBetween)
    return pairs.map { l, r in
        align(left: l, right: r, width: width, char: char, spaceBetween: spaceBetween)
    }
}

extension Array where Element == (String, String) {
    public func aligned(
        spaceBetween: Int = 10,
        char: String = " "
    ) -> [String] {
        let width = optimalWidth(for: self, spaceBetween: spaceBetween)
        return self.map { l, r in
            align(left: l, right: r, width: width, char: char, spaceBetween: spaceBetween)
        }
    }
}

// backwards compat with travel-quote
public func leftAlignText(_ text: String, width: Int) -> String {
    let padding = max(0, width - text.count)
    let paddedText = text + String(repeating: ".", count: padding)
    return paddedText
}

public func rightAlignText(_ text: String, width: Int) -> String {
    let padding = max(0, width - text.count)
    let paddedText = String(repeating: ".", count: padding) + text
    return paddedText
}
