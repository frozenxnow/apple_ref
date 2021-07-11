//: [Previous](@previous)

import Foundation

 //1번. 다음 함수를 실행 시 var closure의 경우 오류로 인해 실행되지 않지만 func closure로 선언하는 경우 클로저 내부에서 값을 캡쳐할 수 있습니다. 그 이유는 무엇일까요? (몸풀기 문제)

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
	// 2. 위의 이름있는 클로저(incrementer함수)를 이름 없는 클로저 형태로 바꿔 보세요

	return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)

let one: Int = incrementByTwo()
let tow: Int = incrementByTwo()
let three:Int = incrementByTwo()
let four:Int = incrementByTwo()
// 2-1. 자 이아이들을 보면 값이 2씩 증가합니다. 그 이유는 무엇일 지 2~3문장 이내로 정의해 봅시다


// Capturing Value & escaping Clouser
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
	DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(amount)) {
		closure()
		print("🍔\(amount)개")
	} 
}

func orderAndMakeBurger() {
	let 주문한버거 = 햄버거(name: "불고기버거")
	print("햄버거 주문이 확인되었어요 : \(주문한버거.name)")
	orderBurger(amount: 1, closure: {
		print("\(주문한버거.name)가 나왔습니다!")
	})
	//3-1. 위의 orderBurger를 클로저 표현을 간소화하여 작성해 주세요. (아래 코드에 답이 있기 때문에 작성하고 아래로 내려주세요)
	print("\(주문한버거.name)가 만들어지고 있어요")
}

orderAndMakeBurger()

//3-2. 아래는 orderAndMakeBurger()의 출력문을 임의로 배치한 것입니다. 출력문을 순서에 맞게 다시 배치해 주세요.

//1. 불고기버거가 만들어지고 있어요
//2. 불고기버거가 나왔습니다!
//3. 햄버거 주문이 확인되었어요 : 불고기버거
//4. 불고기버거는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)



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
// 3-3. 아래는 orderAndMakeBurger2(burger: "파파이스")의 출력문입니다. xxxxx에 들어갈 알맞은 버거를 입력해 주세요.

//햄버거가 준비되고 있어요: xxxxx
//xxxxx가 만들어지고 있어요
//xxxxx는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)
//주문이 xxxxx로 변경되었어요!
//()
//xxxxx가 나왔습니다!
//xxxxx는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)





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
// 4. 아래는 orderAndMakeBurger3(burger: "와퍼")의 출력문 입니다. xxxxx에 해당하는 알맞은 값을 써 주세요.

//햄버거가 준비되고 있어요: xxxxx
//xxxxx가 만들어지고 있어요
//주문이 xxxxx로 변경되었어요!
//xxxxx는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)
//xxxxx가 나왔습니다!
//xxxxx는 주문리스트에서 사라졌어요(메모리에서 사라졌어요)




//: [Next](@next)
