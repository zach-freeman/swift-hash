import Cocoa
import Foundation

let expectedHashValue = 683122939450  //monster
//let expectedHashValue = 664523346955  //aaageno
let letters = "acdegilmnoprstuw"
let characterSet = Array(letters)

let uLetters = letters.utf8
let uCharacterSet = Array(uLetters)
let numberOfCharacters = count(characterSet)

func stringFromCodeUnit(codeUnit: [UInt8]) -> String {
    return String.fromCString(UnsafePointer<CChar>(codeUnit))!
}

func testThisString(stringRep : [UInt8]) -> Bool {
    var foundTheMagicString = false;
    var actualHashValue = hash(stringRep)
    if (actualHashValue == expectedHashValue) {
        println("Success")
        println(actualHashValue)
        var stringToTest = stringFromCodeUnit(stringRep)
        println(stringToTest)
        foundTheMagicString = true
    }


    return foundTheMagicString
}

func hash(stringRep : [UInt8]) -> Int {
    var h : Int = 7;
    let multiplier : Int = 37;
    for var i=0; i < count(stringRep); i++ {
        var currentCharacter = stringRep[i]
        var letterIndexOfCurrentCharacter = find(uCharacterSet, currentCharacter)
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
        var foundString = testThisString(prefix)
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
        newPrefix.append(uCharacterSet[i])
        var newDesiredLength = desiredLength - 1

        // n is decreased, because we have added a new character
        findAllNLengthRec(&newPrefix, &newDesiredLength);
    }
}



findStringForExpectedHashValue()
