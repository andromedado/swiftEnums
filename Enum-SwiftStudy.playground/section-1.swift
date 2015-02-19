/**
Classes, Structs and Enums, Oh My!
*/

class Animal<Edible> {
    var bellyContents : [Edible]?

    func eat(food : Edible) -> () {
        self.bellyContents = self.bellyContents != nil ? self.bellyContents : []
        self.bellyContents?.append(food)
    }
}

struct ABunchOfDoritos {
    let kg : Int
    let flavor : Flavor
}

enum Flavor {
    case NachoCheese, CoolRanch, SalsaVerde
    //NO meaninful primitive representation
}

class Fish<T> : Animal<ABunchOfDoritos> {
    //Note: This <T> is an artifact of swift complier's requirements =\
    func swim(#distance: Int) -> () {
        //
    }
}

let wanda = Fish<ABunchOfDoritos>()
//Note: This <ABunchOfDoritos> doesn't actually do anything (as written), just another artifact =\

wanda.eat(ABunchOfDoritos(kg: 10, flavor: .NachoCheese))

wanda.bellyContents


/**
Classes: Inheritance, Polymorphism, Reference (vs Value)
 - Fish gets free functionality from super class
 - Animal definition provides some constraints/requirements for subclasses

Structs: Value (vs Reference), clump of things that have meaning relative to each other
 - By packaging mass and flavor, we make programatic suggestion
 - 10kg of Cool Ranch Doritos is asserted to have a VALUE meaning, not reference
 - Very different from just exposing `eat(kg: Int, flavor: Flavor)` -> Code forces us to keep the two values associated

Enums: Value (vs Reference), Finite Set
 - We know ahead of time all of the values/instances
*/

//Those all sound very different, yes?
//well, try to keep those at the front of your mind, because all three can do very similar things

