/**
Enum Flavors

- Member Values (no "value" as such)
- Raw Value (named primitive values)
- Associated Values
*/


//Member Values
enum Suit {
    case Spades, Diamonds, Hearts, Clubs
}
//No meaningful primitive representation


//Raw Value
enum CheckoutTableSection : Int {
    case Error,
    Login,
    Product,
    Offer,
    Shipping,
    Billing,
    Shipment,
    Note,
    ReturnPolicy,
    FinalNumbers,
    AuthWarning,
    NumSections
}
//Default behavior for an int-enum is to auto-increment starting at 0

CheckoutTableSection.Error.rawValue

CheckoutTableSection(rawValue: 5) == CheckoutTableSection.Billing
//Find corresponding enum for a primitive value (may be nil)

if let section = CheckoutTableSection(rawValue: 4) {
    switch (section) {
    case .Login:
        println("login!")
    case .Shipping:
        println("shipping!")
    default:
        println("idk")
    }
}
//Raw Value Enums can be thought of as named primitive values
//e.g.
enum Currency : String {
    case USD = "USD"
    case EUR = "EUR"
    case GBP = "GBP"
}
Currency.EUR // "Enum Value", use for comparison
Currency.EUR == Currency.USD // False
Currency.EUR.rawValue



//Associated Values
//This is the hardest one for me to fully wrap my head around

//Terse representation of a response type
enum NetworkResponse {
    case Success(HttpCode)
    case Failure(HttpCode, String)
}

enum HttpCode : Int {
    case OK = 200
    case Created = 201
    case Accepted = 202
    case InternalServerError = 500
    case BadGateway = 502
    case GatewayTimeout = 504
}

let resp1 = NetworkResponse.Failure(.BadGateway, "Something went wrong")
let resp2 = NetworkResponse.Success(.OK)
let resp3 = NetworkResponse.Failure(.BadGateway, "Something went wrong")

// Decomposition via switch/case

switch (resp1) {

//case var .Failure(code, msg):
//case .Failure(var code, var msg):
case .Failure(let code, var msg):
    println("oh yeah!: \(msg)")

case .Success(var code):
    println(code)

}
// This decomposition seems to be the only way to consume Associated Values Enums
// NOT this style:
// let NetworkResponse.Failure(a, b) = resp1
// NOR
// if resp1 == .Failure(var code, var msg) {}

//Associated Values Equality Testing must be defined in userland
func ==(a : NetworkResponse, b : NetworkResponse) -> Bool {
    switch (a) {
    case let .Success(code):
        switch (b) {
        case let .Success(bCode):
            return code == bCode
        case let .Failure(bCode, bMsg):
            return false
        }
    case let .Failure(code, msg):
        switch (b) {
        case let .Success(bCode):
            return false
        case let .Failure(bCode, bMsg):
            return bCode == code && msg == bMsg
        }
    }
}


resp1 == resp2
resp1 == resp3

/**
Final Notes:
 - Enumerate over enum-members? NOPE (nothing native)
*/

