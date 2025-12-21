public func optimalWidth(for pairs: [(String, String)], spaceBetween: Int = 10) -> Int {
    let maxPairLength =
        pairs
        .map { $0.0.count + $0.1.count }
        .max() ?? 0
    return maxPairLength + spaceBetween
}
