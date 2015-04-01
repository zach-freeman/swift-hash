import Cocoa
import Foundation

let expectedHashValue = 683122939450  //monster
//let expectedHashValue = 664523346955  //aaageno
let letters = "acdegilmnoprstuw"
let characterSet = Array(letters)
let numberOfCharacters = countElements(characterSet)


func testThisString(stringToTest: String) -> Bool {
    var foundTheMagicString = false;
    var actualHashValue = hash(stringToTest)
    if (actualHashValue == expectedHashValue) {
        println("Success")
        println(actualHashValue)
        println(stringToTest)
        foundTheMagicString = true
    }
    
    
    return foundTheMagicString
}

func hash(theString: String) -> Int {
    var h : Int = 7;
    let multiplier : Int = 37;
    for var i=0; i < countElements(theString); i++ {
        let stringIndex = advance(letters.startIndex, i)
        var characterToFind = theString[stringIndex];
        if var characterIndex = find(letters, characterToFind) {
            var characterPosition = distance(letters.startIndex, characterIndex)
            h = h * multiplier + characterPosition
        }
    }
    return h;
}

func findStringForExpectedHashValue() -> Void {
    findAllNLength()
}

//  mainly a wrapper over recursive function printAllNLengthRec()
func findAllNLength() -> Void {
    var prefix = ""
    var desiredLength = 7
    findAllNLengthRec(&prefix, &desiredLength);
}

// The main recursive method to print all possible strings of length n
func findAllNLengthRec(inout prefix: String, inout desiredLength: Int) -> Void{
    
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
        //var newPrefix = prefix + [characterSet[advance(characterSet.startIndex, i)]]
        var newPrefix = prefix + [characterSet[i]]
        var newDesiredLength = desiredLength - 1
        
        // n is decreased, because we have added a new character
        findAllNLengthRec(&newPrefix, &newDesiredLength);
    }
}



findStringForExpectedHashValue()

