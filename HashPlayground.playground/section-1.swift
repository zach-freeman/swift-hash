// Playground - noun: a place where people can play

import Cocoa
import Foundation

let expectedHashValue = 680131659347
var counter = 0


findStringForHashValue(expectedHashValue)


func hash(theString: String) -> Int {
    var h : Int = 7;
    let multiplier : Int = 37;
    let letters = "acdegilmnoprstuw"
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

func findStringForHashValue(hash: Int) -> Void {
    let letters = "acdegilmnoprstuw"
    var characterSet = Array(letters)
    let desiredLength = 7
    findAllNLength(characterSet, desiredLength)
}

//  mainly a wrapper over recursive function printAllNLengthRec()
func findAllNLength(characterSet: [Character], desiredLength: Int) -> Void {
    var numberOfCharacters = countElements(characterSet)
    findAllNLengthRec(characterSet, "", numberOfCharacters, desiredLength);
}

// The main recursive method to print all possible strings of length n
func findAllNLengthRec(characterSet: [Character], prefix: String, numberOfCharacters: Int, desiredLength: Int) -> Void{
    
    // Base case: n is 0, print prefix
    if (desiredLength == 0) {
        var actualHashValue = hash(prefix)
        if (actualHashValue == expectedHashValue) {
            print("Success")
            print(prefix)
            exit(0)
        } else {
            print("Failure")
        }
        return;
    }
    
    // One by one add all characters from set and recursively
    // call for n equals to n-1
    for var i = 0; i < numberOfCharacters; ++i {
        
        // Next character of input added
        var newPrefixIndex = advance(characterSet.startIndex, i)
        var newPrefix = prefix + [characterSet[newPrefixIndex]];
        
        // n is decreased, because we have added a new character
        findAllNLengthRec(characterSet, newPrefix, numberOfCharacters, desiredLength - 1);
    }
}
