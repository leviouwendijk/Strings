// adapted from plate
// callback for decoupling (used to be 'stripANSI()' call)

public func createBox(
    for lines: [String],
) -> String {
    let maxLength = lines.map { $0.count }.max() ?? 0
    
    let horizontalBorder = "+" + String(repeating: "-", count: maxLength + 2) + "+"
    var boxedContent = horizontalBorder + "\n"
    
    for (index, line) in lines.enumerated() {
        let strippedLine = lines[index]
        let paddingCount = maxLength - strippedLine.count
        let paddedLine = line + String(repeating: " ", count: paddingCount)
        boxedContent += "| \(paddedLine) |\n"
    }
    
    boxedContent += horizontalBorder
    return boxedContent
}

public func array_of_lines(
    from string: String,
    mutation callback: @Sendable (String) -> String = { $0 }
) -> [String] { 
    let lines = string.split(separator: "\n", omittingEmptySubsequences: false)
    return lines.map { callback(String($0)) }
}

public func createBox(
    for content: String,
    callback: @Sendable (String) -> String
) -> String {
    let lines = array_of_lines(from: content, mutation: callback)
    return createBox(for: lines)
}
