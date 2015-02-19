/**
Classes, Structs and Enums are all capable of bundling instance/type properties and methods
*/

class Bird {
    var name : String?
    let klass : Classification

    init(klass: Classification) {
        self.klass = klass
    }

    func fly(#distance : Int, direction: Direction) -> () {
        println("\(self.name) is flying \(distance)m \(direction.abbrv())")
    }
    class var numWings : Int {
        return 2
    }
    class func canMate(one: Bird, two : Bird) -> Bool {
        return one.klass.same(two.klass)
    }
}

struct Classification {
    let Kingdom : String,
    Phylum : String,
    Class : String,
    Order : String

    func same(comparator: Classification) -> Bool {
        return comparator.Kingdom == self.Kingdom &&
        comparator.Phylum == self.Phylum &&
        comparator.Class == self.Class &&
        comparator.Order == self.Order
    }

    static func birdOrder(order: String) -> Classification {
        return Classification(Kingdom: "Animalia", Phylum: "Chordata", Class: "Aves", Order: order)
    }

    static let author = "Carl Linnaeus"
}

enum Direction {
    case North, East, South, West
    func abbrv() -> Character {
        switch(self) {
        case .North:
            return "N"
        case .East:
            return "E"
        case .South:
            return "S"
        case .West:
            return "W"
        }
    }
    static let Sunrise = Direction.East
    static let fancyName = "CardinalDirection"
    static func combine(firstDir : Direction, secondDir : Direction) -> String {
        return "\(firstDir.abbrv())\(secondDir.abbrv())"
    }
}

Bird.numWings
Classification.author
Direction.Sunrise

let woody = Bird(klass: Classification.birdOrder("Piciformes"))
woody.name = "Woody the Woodpecker"
woody.fly(distance: 100, direction: .South)
woody.fly(distance: 100, direction: Direction.Sunrise)

let wendy = Bird(klass: Classification.birdOrder("Piciformes"))
Bird.canMate(woody, two: wendy)
let daisy = Bird(klass: Classification.birdOrder("Anseriformes"))
Bird.canMate(woody, two: daisy)

Direction.combine(.North, secondDir: .West)

