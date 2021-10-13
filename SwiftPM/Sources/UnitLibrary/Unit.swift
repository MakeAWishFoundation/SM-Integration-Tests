import SwiftyPrototype

public struct Unit {
    public var text = "Hello, World!"

    public init() {}

    public func usePrototype() {
        let generator = NumberGeneratorPrototype()

        Given(generator, .next(willReturn: 0, 1, 2, 3, 4))

        print(generator.next())
        print(generator.next())
        print(generator.next())
        print(generator.next())
    }
}

protocol AutoMockable { }

protocol NumberGenerator: AutoMockable {
    func next() -> Int
    func set(range: ClosedRange<Int>)
}
