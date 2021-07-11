import Foundation

var x = 10
var y = 20

var xPlusY1: Int {
	get {
		return x + y // 1번답
	}
	set {
		x = newValue // 2번
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
// 답 : 0

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
// 답 : 0, 1, 2

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
// 5번 : 위의 unitRectangle.height는 어떤 값으로 출력될까요? 답 : 12







// capturingValue&escapingClosure

 //1번. 다음 함수를 실행 시 var closure의 경우 오류로 인해 실행되지 않지만 func closure로 선언하는 경우 클로저 내부에서 값을 캡쳐할 수 있습니다. 그 이유는 무엇일까요? - 변수 closure는 리턴타입이 Int 이지만 func closure의 경우 리턴타입이 () -> Int 이기 때문 

func makeClouserCapturingValue(_ amount: Int) -> (() -> Int) {
	var example: Int = 10

//	var closure = { () -> Int in
//		example += amount
//		return example
//	}()

	func closure() -> Int {
		example += amount
		return example
	}

	return closure
}

// 2번
let increase = makeClouserCapturingValue(2)

let first = increase()
let second = increase()


func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
	var runningTotal = 0
	func incrementer() -> Int {
		runningTotal += amount
		return runningTotal
	}
	// 2. 위의 이름있는 클로저를 이름 없는 클로저 형태로 바꿔 보기
//	var incrementer = { () -> Int in
//		runningTotal += amount
//		return runningTotal
//	}
	return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)

let one: Int = incrementByTwo()
let tow: Int = incrementByTwo()
let three:Int = incrementByTwo()
let four:Int = incrementByTwo()

// 2-1.  클로저 내부에서 캡쳐링한 value, 즉 클로저 안에서 사용한 변수들은 클로저 밖의 실행이 끝나도 reference 카운트가 1 올라갔기 때문에(= 주변 환경에 상관없이 메모리에서 사라지지 않기 때문에) 클로저가 포함된 코드가 종료 되어도 해당 값을 가지고 있는다.  



//orderAndMakeBurger, orderAndMakeBurger2, orderAndMakeBurger3의 출력문을 확인 할 땐  1개씩 확인하셔야 합니다. (EX :  orderAndMakeBurger와 orderAndMakeBurger2를 동시에 실행하는 경우 출력문이 다를 수 있습니다.)

class 햄버거 {
	let name: String
	init(name: String) {
		self.name = name
	}
	deinit {
		print("\(self.name)는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)")
	}
}

func orderBurger(amount: Int, closure: @escaping () -> ()) {
	var count = 0
	
	DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(amount)) {
		print("\(count += 1)")
		closure()
	}
}

func orderAndMakeBurger() {
	let 주문한버거 = 햄버거(name: "불고기버거")
	print("햄버거 주문이 확인되었어요 : \(주문한버거.name)")
	orderBurger(amount: 1) {
		print("\(주문한버거.name)가 나왔습니다!")
	}
	print("\(주문한버거.name)가 만들어지고 있어요")
}
orderAndMakeBurger()
//3-2
//햄버거 주문이 확인되었어요 : 불고기버거
//불고기버거가 만들어지고 있어요
//()
//불고기버거가 나왔습니다!
//불고기버거는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)



func orderAndMakeBurger2(burger: String) {
	var 주문버거 = 햄버거(name: burger)
	print("햄버거가 준비되고 있어요: \(주문버거.name)")

	 orderBurger(amount: 1) {
	 print("\(주문버거.name)가 나왔습니다.")
	}
	
	print("\(주문버거.name)가 만들어지고 있어요")
	주문버거 = 햄버거(name: "싸이버거")
	print("주문이 \(주문버거.name)로 변경되었어요!")
}

orderAndMakeBurger2(burger: "파파이스")
// 3-3
//햄버거가 준비되고 있어요: 파파이스
//파파이스가 만들어지고 있어요
//파파이스는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)
//주문이 싸이버거로 변경되었어요!
//()
//싸이버거가 나왔습니다!
//싸이버거는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)



//캡쳐 리스트
func orderAndMakeBurger3(burger: String) {
	var 주문버거 = 햄버거(name: burger)
	print("햄버거가 준비되고 있어요: \(주문버거.name)")
	orderBurger(amount: 1) { [주문버거] in
		print("\(주문버거.name)가 나왔습니다!")
	}
	print("\(주문버거.name)가 만들어지고 있어요")
	주문버거 = 햄버거(name: "슈슈버거")
	print("주문이 \(주문버거.name)로 변경되었어요!")
}

orderAndMakeBurger3(burger: "와퍼")
// 4.
//햄버거가 준비되고 있어요: 와퍼
//와퍼가 만들어지고 있어요
//주문이 슈슈버거로 변경되었어요!
//슈슈버거는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)
//()
//와퍼가 나왔습니다!
//와퍼는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)



