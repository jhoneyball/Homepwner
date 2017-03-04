import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date

    
    init(name: String, serialNumber: String?, valueInDollars: Int) {
        self.name = name
        self.serialNumber = serialNumber
        self.valueInDollars = valueInDollars
        self.dateCreated = Date()
        
        super.init()
    }
    
    convenience init(random: Bool) {
        if random {
            let advectives = ["Fluffy", "Rusty", "Shiny"]
            let colour = ["Brown", "Green", "Blue"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            func randomWord(_ arrayOfWords: [String]) -> String {
                return arrayOfWords[Int(arc4random_uniform(UInt32(arrayOfWords.count)))]
            }
            
            let randomName = "\(randomWord(advectives)) \(randomWord(colour))"
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            let randomValue = Int(arc4random_uniform(100))
            
            self.init(name: randomName, serialNumber: randomSerialNumber, valueInDollars: randomValue)
        } else {
            self.init(name: "", serialNumber: nil, valueInDollars: 0)
        }
    }
}
