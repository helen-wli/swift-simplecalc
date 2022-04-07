import Foundation
print("Welcome to the UW Calculator Playground")

func calculate(_ args : [String]) -> Int {
    let length = args.count
    if (length == 1) {
        return 0
    }
    else if (length == 3) {
        let type = args[1]
        switch type {
        case "%":
            return Int(args[0])! % Int(args[2])!
        case "+":
            return Int(args[0])! + Int(args[2])!
        case "-":
            return Int(args[0])! - Int(args[2])!
        case "*":
            return Int(args[0])! * Int(args[2])!
        case "/":
            return Int(args[0])! / Int(args[2])!
        default:
            return -1
        }
    }
    else {
        let type = args[length - 1]
        switch type {
        case "fact":
            var product = 1
            if (Int(args[0])! > 0) {
                for n in 1...Int(args[0])! {
                    product *= n
                }
            }
            return product
        case "count":
            return length - 1
        case "avg":
            let indices = length - 2
            var sum = 0
            for i in 0...indices {
                sum += Int(args[i])!
            }
            return sum / (length - 1)
        default:
            return -1
        }
    }
}

func calculate(_ arg: String) -> Int {
    let components = arg.components(separatedBy: " ")
    if (components.count == 3) {
        let expression = NSExpression(format:arg)
        return expression.expressionValue(with: nil, context: nil) as! Int
    }
    else {
        let type = components[components.count - 1]
        switch type {
        case "count":
            return components.count - 1
        case "avg":
            let indices = components.count - 2
            var sum = 0
            for i in 0...indices {
                sum += Int(components[i])!
            }
            return sum / (components.count - 1)
        case "fact":
            var product = 1
            for n in 1...Int(components[0])! {
                product *= n
            }
            return product
        default:
            return -1
        }
    }
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    let type = args[1]
    switch type {
    case "+":
        return Double(args[0])! + Double(args[2])!
    case "-":
        return Double(args[0])! - Double(args[2])!
    case "*":
        return Double(args[0])! * Double(args[2])!
    case "/":
        return Double(args[0])! / Double(args[2])!
    case "%":
        let result: Double = Double(Int(args[0].prefix(1))! % Int(args[2].prefix(1))!)
        return result
    default:
        return -1.0
    }
}

func calculate(_ arg: String) -> Double {
    let components = arg.components(separatedBy: " ")
    let strLength = components.count
    let type = components[strLength - 1]
    switch type {
    case "count":
        return Double(strLength - 1)
    default:
        return -1
    }
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0

calculate("1.0 2.0 3.0 4.0 5.0 count") == 5.0
