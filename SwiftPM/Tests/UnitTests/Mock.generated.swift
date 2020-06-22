// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 4.0.0

import SwiftyMocky
import XCTest
import Foundation
@testable import Unit


// MARK: - NumberGenerator

open class NumberGeneratorMock: NumberGenerator, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func next() -> Int {
        addInvocation(.m_next)
		let perform = methodPerformValue(.m_next) as? () -> Void
		perform?()
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_next).casted()
		} catch {
			onFatalFailure("Stub return value not specified for next(). Use given")
			Failure("Stub return value not specified for next(). Use given")
		}
		return __value
    }

    open func set(range: ClosedRange<Int>) {
        addInvocation(.m_set__range_range(Parameter<ClosedRange<Int>>.value(`range`)))
		let perform = methodPerformValue(.m_set__range_range(Parameter<ClosedRange<Int>>.value(`range`))) as? (ClosedRange<Int>) -> Void
		perform?(`range`)
    }


    fileprivate enum MethodType {
        case m_next
        case m_set__range_range(Parameter<ClosedRange<Int>>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_next, .m_next):
                return true 
            case (.m_set__range_range(let lhsRange), .m_set__range_range(let rhsRange)):
                guard Parameter.compare(lhs: lhsRange, rhs: rhsRange, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_next: return 0
            case let .m_set__range_range(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_next: return ".next()"
            case .m_set__range_range: return ".set(range:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func next(willReturn: Int...) -> MethodStub {
            return Given(method: .m_next, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func next(willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_next, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func next() -> Verify { return Verify(method: .m_next)}
        public static func set(range: Parameter<ClosedRange<Int>>) -> Verify { return Verify(method: .m_set__range_range(`range`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func next(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_next, performs: perform)
        }
        public static func set(range: Parameter<ClosedRange<Int>>, perform: @escaping (ClosedRange<Int>) -> Void) -> Perform {
            return Perform(method: .m_set__range_range(`range`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method.assertionName())`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
    }
}

