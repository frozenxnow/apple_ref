import Foundation



// class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    var apartment: Apartment?
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) {
//        self.unit = unit
//    }
//    weak var tenant: Person?
//    deinit {
//        print("Apartment \(unit) is being deinitialized")
//    }
//}
//
//var john: Person?
//var unit4A: Apartment?
//
//john = Person(name: "john Appleseed")
//unit4A = Apartment(unit: "4A")
//
//john!.apartment = unit4A
//unit4A!.tenant = john
//
//john = nil
//unit4A = nil


//class Customer {
//    let name: String
//    var card: CreditCard?
//    init(name: String) {
//        self.name = name
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//
//class CreditCard {
//    let number: UInt64
//    unowned let customer: Customer
//    init(number: UInt64, customer: Customer) {
//        self.number = number
//        self.customer = customer
//    }
//    deinit {
//        print("Card #\(number) is being deinitialized")
//    }
//}
//
//var john: Customer? = Customer(name: "John Appleseed")
//john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
//
//john = nil

//class Department {
//    var name: String
//    var courses: [Course]
//    init(name: String) {
//        self.name = name
//        self.courses = []
//    }
//}
//
//class Course {
//    var name: String
//    unowned var department: Department
//    unowned var nextCourse: Course?
//    init(name: String, in department: Department) {
//        self.name = name
//        self.department = department
//        self.nextCourse = nil
//    }
//}
//
//let department = Department(name: "Computer Science Engineering")
//
//let intro = Course(name: "Welcome to C language", in: department)
//let intermediate = Course(name: "Welcome to C++ language", in: department)
//let advanced = Course(name: "Welcome to Swift", in: department)
//
//intro.nextCourse = intermediate
//intermediate.nextCourse = advanced
//department.courses = [intro, intermediate, advanced]

//class Country {
//    let name: String
//    var capitalCity: City!
//    init(name: String, capitalName: String) {
//        self.name = name
//        self.capitalCity = City(name: capitalName, country: self)
//    }
//}
//
//class City {
//    let name: String
//    unowned let country: Country
//    init(name: String, country: Country) {
//        self.name = name
//        self.country = country
//    }
//}
//
//var country = Country(name: "Canada", capitalName: "Ottawa")
//print("\(country.name)'s capital city is called \(country.capitalCity.name)")


//struct Resolution {
//    var width = 0
//    var height = 0
//}
//
//class VideoMode {
//    var resolution = Resolution()
//    var interlaced = false
//    var frameRate = 0.0
//    var name: String?
//}
//
//let someResolution = Resolution()
//let someVideoMode = VideoMode()
//
//print("The width of someResolution is \(someResolution.width)")
//print("The width of someVideoMode is \(someVideoMode.resolution.width)")
//
//someVideoMode.resolution.width = 1280
//print("The width of someVideoMode is \(someVideoMode.resolution.width)")
//
//let hd = Resolution(width: 1920, height: 1080)
//var cinema = hd
//
//cinema.width = 2048
//print("cinema is now \(cinema.width) pixels wide")
//print("hd is still \(hd.width) pixels wide")
//
//
//
//enum CompassPoint {
//    case north, south, east, west
//    mutating func turnNorth() {
//        self = .north
//    }
//}
//
//var currentDirection = CompassPoint.west
//let rememberedDirection = currentDirection
//currentDirection.turnNorth()
//
//print("The current direction is \(currentDirection)")
//print("The remembered direction is \(rememberedDirection)")
//
//
//
//let tenEighty = VideoMode()
//tenEighty.resolution = hd
//tenEighty.interlaced = true
//tenEighty.name = "1080i"
//tenEighty.frameRate = 25.0
//
//let alsoTenEighty = tenEighty
//alsoTenEighty.frameRate = 30.0
//
//
//print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
//
//
//if tenEighty === alsoTenEighty {
//    print("tenEighty and alsoTenEighty refer to the same Video instance.")
//}


//func greet(person: String) -> String {
//    let greeting = "Hello, \(person)!"
//    return greeting
//}
//
//print(greet(person: "Anna"))
//print(greet(person: "Brian"))
//
//func sayHelloWorld() -> String {
//    return "Hello, World!"
//}
//print(sayHelloWorld())
//
//func greet(person: String, alreadyGreeted: Bool) -> String {
//    if alreadyGreeted {
//        return greetAgain(person: person)
//    } else {
//        return greet(person: person)
//    }
//}

//func greet(person: String) {
//    print("Hello, \(person)!")
//}
//greet(person: "Dave")

//func printAndCount(string: String) -> Int {
//    print(string)
//    return string.count
//}
//
//func printWithoutCounting(string: String) {
//    let _ = printAndCount(string: string)
//}
//printAndCount(string: "Hello, World!")
//printWithoutCounting(string: "hello, world!")

//func minMax(array: [Int]) -> (min: Int, max: Int)? {
//    if array.isEmpty { return nil }
//    var currenMin = array[0]
//    var currenMax = array[0]
//    for value in array[1..<array.count] {
//        if value < currenMin {
//            currenMin = value
//        } else if value > currenMax {
//            currenMax = value
//        }
//    }
//    return (currenMin, currenMax)
//}

//func greeting(for person: String) -> String {
//    "Hello, \(person)!"
//}
//print(greeting(for: "Dave"))
//
//func anotherGreeting(for person: String) -> String {
//    return "Hello, \(person)!"
//}
//print(anotherGreeting(for: "Dave"))

//func someFunction(_ firstParameterName: Int, secondParameterNAme: Int) {
//
//}
//someFunction(1, secondParameterNAme: 2)

//func greet(person: String, from hometown: String) -> String {
//    return "Hello \(person)! Glad you could visit from \(hometown)."
//}
//print(greet(person: "Bill", from: "Cupertino"))
//
//func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
//
//}
//
//someFunction(parameterWithoutDefault: 3) // parameterWithDefault: 12
//someFunction(parameterWithoutDefault: 4, parameterWithDefault: 7)

//func arithmeticMean(_ numbers: Double...) -> Double {
//    var total: Double = 0
//    for number in numbers {
//        total += number
//    }
//    return total / Double(numbers.count)
//}
//
//arithmeticMean(1, 2, 3, 4, 5)
//arithmeticMean(3, 8.25, 18.75)

//func swapTwoInts(_ a: inout Int, _ b: inout Int) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}
//
//var someInt = 3
//var anotherInt = 107
//swap(&someInt, &anotherInt)
//print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//func addTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a + b
//}
//
//func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a * b
//}
//
//
//var mathFunction: (Int, Int) -> Int = addTwoInts
//print("Result: \(mathFunction(2,3))")
//
//mathFunction = multiplyTwoInts
//print("Result: \(mathFunction(2,3))")
//
//func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//    print("Result: \(mathFunction(a, b))")
//}
//
//printMathResult(addTwoInts, 3, 5)



func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int { return input + 1 }
    func stepBackward(_ input: Int) -> Int { return input - 1 }
    
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")

while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
