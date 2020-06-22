import SwiftyPrototype

struct Unit {
    var text = "Hello, World!"

    func usePrototype() {
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
