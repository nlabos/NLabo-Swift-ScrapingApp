import UIKit

var favoriteDictionary = [String:String]()

favoriteDictionary["Fruit"] = "Apple"
favoriteDictionary["Sports"] = "Tennis"
favoriteDictionary["Study"] = "Programming"

print(favoriteDictionary["Study"])

if let studyValue = favoriteDictionary["Study"] {
    print(studyValue)
}
