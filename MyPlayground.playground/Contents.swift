import UIKit

var favoriteDictionary = [String:String]()

favoriteDictionary["Fruit"] = "Apple"
favoriteDictionary["Sports"] = "Tennis"
favoriteDictionary["Study"] = "Programming"

//ここは黄色の警告が出るので気になる生徒にはオプショナルの説明をした上で print(favoriteDictionary["Study"] as Any) にするとエラーが消えることを説明する
print(favoriteDictionary["Study"])

if let studyValue = favoriteDictionary["Study"] {
    print(studyValue)
}


//20回で使うプレイグラウンド

for i in 1..<10 {
    print("i: \(i)")
}

for i in 1...10 {
    print("i: \(i)")
}

let arrayIntData = [1, 2, 3, 4]

for data in arrayIntData {
    print("data: \(data)")
}

let arrayStringData = ["犬", "猫", "きつね", "たぬき"]

for data in arrayStringData{
    print("data: \(data)")
}


for i in 0..<arrayIntData.count {
    print("\(arrayIntData[i])番目のデータは\(arrayStringData[i])です")
    
}

var count = 0
var total = 0

while count < 10 {
    count += 1
    total += count
}
print("count: \(count) total: \(total)")

var repeatCount = 0
var repeatTotal = 0

repeat {
    repeatCount += 1
    repeatTotal += repeatCount
} while(repeatCount < 10)
    
print("repeatCount: \(repeatCount) repeatTotal\(repeatTotal)")

