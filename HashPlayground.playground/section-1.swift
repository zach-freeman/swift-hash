// Playground - noun: a place where people can play

import Cocoa

let testString = "leepadg"
let expectedHashValue = 680131659347
var actualHashValue = hash(testString)

if (actualHashValue == expectedHashValue) {
    print("Success")
} else {
    print("Failure")
}

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
