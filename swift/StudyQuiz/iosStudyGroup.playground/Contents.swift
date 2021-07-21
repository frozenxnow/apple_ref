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

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")

