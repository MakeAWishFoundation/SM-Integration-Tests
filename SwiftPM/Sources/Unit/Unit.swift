struct Unit {
    var text = "Hello, World!"
}

protocol AutoMockable { }

protocol NumberGenerator: AutoMockable {
    func next() -> Int
    func set(range: ClosedRange<Int>)
}
