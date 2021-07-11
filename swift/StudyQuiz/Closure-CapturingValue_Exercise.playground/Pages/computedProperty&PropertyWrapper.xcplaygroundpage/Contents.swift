//: [Previous](@previous)

import Foundation


var x = 10
var y = 20

var xPlusY1: Int {
	get {

	}
}

// 1. 위의 xPlusY1 을 출력했을 때 x와 y 프로퍼티의 합이 나오도록 하기
//2. xPlusY1의 값에 50을 할당하는 경우 변수 x 의 값도 동일하게 바뀌도록 구현하기


var x2 = 10
class StudyTimeCounter {
	var totalTime: Int = 0 {
		willSet {
			print("스터디의 총시간은 \(newValue)시간 입니다.")
		}

		didSet {
			x2 = oldValue
		}

	}
}
let test = StudyTimeCounter()
test.totalTime = 50
x2
// 3번 : 위와 같이 실행 시 x2의 값은?

//4번 문제
let studyTimeCounter = StudyTimeCounter()
studyTimeCounter.totalTime
studyTimeCounter.totalTime = 1
x2

studyTimeCounter.totalTime = 2
x2

studyTimeCounter.totalTime = 3
x2

//4. 각 x2 의 값에는 어떤 값이 할당되어 있을까요? 


// 5번
@propertyWrapper
struct SmallNumber {
	private var maximum: Int
	private var number: Int

	var wrappedValue: Int {
		get { return number }
		set { number = min(newValue, maximum) }
	}

	init() {
		maximum = 12
		number = 0
	}

	init(wrappedValue: Int) {
		maximum = 12
		number = min(wrappedValue, maximum)
	}

	init(wrappedValue: Int, maximum: Int) {
		self.maximum = maximum
		number = min(wrappedValue, maximum)
	}
}

struct UnitRectangle {
	@SmallNumber var height: Int = 1
	@SmallNumber var weight: Int = 1
}

var unitRectangle = UnitRectangle()

unitRectangle.height = 100
print(unitRectangle.height)
// 5번 : 위의 unitRectangle.height는 어떤 값으로 출력될까요?

//: [Next](@next)
