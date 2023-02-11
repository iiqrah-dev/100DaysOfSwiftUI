// Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:
//
// A property storing how many rooms it has.
// A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
// A property storing the name of the estate agent responsible for selling the building.
// A method for printing the sales summary of the building, describing what it is along with its other properties.

protocol Building {
    var buildingType: String {get}
    var numberOfRooms: Int {get set}
    var cost: Double {get set}
    var agentName: String {get}
    func salesSummary()
}

extension Building {
    func salesSummary(){
        print("""
Building Type: \(buildingType)
Number of Rooms: \(numberOfRooms)
Cost: $\(cost)
Agen Name: \(agentName)
""")
    }
}

struct House: Building {
    let buildingType = "House"
    var numberOfRooms: Int
    var cost: Double
    var agentName: String
}

struct Office: Building {
    let buildingType = "Office"
    var numberOfRooms: Int
    var cost: Double
    var agentName: String
}

var myHome = House(numberOfRooms: 2, cost: 550000, agentName: "ABC Properties")
myHome.salesSummary()
