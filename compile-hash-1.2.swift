import Cocoa
import Foundation

let expectedHashValue = 683122939450  //monster
//let expectedHashValue = 664523346955  //aaageno
let letters = "acdegilmnoprstuw"
let codeUnitLetters = letters.utf8
let codeUnitCharacterSet = Array(codeUnitLetters)
let numberOfCharacters = count(codeUnitCharacterSet)

func stringFromCodeUnit(codeUnit: [UInt8]) -> String {
    return String.fromCString(UnsafePointer<CChar>(codeUnit))!
}

func testThisCodeUnit(codeUnitArray : [UInt8]) -> Bool {
    var foundTheMagicString = false;
    var actualHashValue = hash(codeUnitArray)
    if (actualHashValue == expectedHashValue) {
        println("Success")
        println(actualHashValue)
        var stringToTest = stringFromCodeUnit(codeUnitArray)
        println(stringToTest)
        foundTheMagicString = true
    }


    return foundTheMagicString
}

func hash(codeUnitArray : [UInt8]) -> Int {
    var h : Int = 7;
    let multiplier : Int = 37;
    for var i=0; i < count(codeUnitArray); i++ {
        var currentCharacter = codeUnitArray[i]
        var letterIndexOfCurrentCharacter = find(codeUnitCharacterSet, currentCharacter)
        h = h * multiplier + letterIndexOfCurrentCharacter!
    }
    return h;
}

func findStringForExpectedHashValue() -> Void {
    findAllNLength()
}

//  mainly a wrapper over recursive function printAllNLengthRec()
func findAllNLength() -> Void {
    var prefix = [UInt8]()
    prefix += "".utf8
    var desiredLength = 7
    findAllNLengthRec(&prefix, &desiredLength);
}

// The main recursive method to print all possible strings of length n
func findAllNLengthRec(inout prefix: [UInt8], inout desiredLength: Int) -> Void{

    // Base case: n is 0, print prefix
    if (desiredLength == 0) {
        var foundString = testThisCodeUnit(prefix)
        if (foundString == true) {
            exit(0)
        }
        return;
    }

    // One by one add all characters from set and recursively
    // call for n equals to n-1
    for var i = 0; i < numberOfCharacters; ++i {

        // Next character of input added
        var newPrefix = [UInt8]()
        newPrefix += prefix
        newPrefix.append(codeUnitCharacterSet[i])
        var newDesiredLength = desiredLength - 1

        // n is decreased, because we have added a new character
        findAllNLengthRec(&newPrefix, &newDesiredLength);
    }
}



findStringForExpectedHashValue()
