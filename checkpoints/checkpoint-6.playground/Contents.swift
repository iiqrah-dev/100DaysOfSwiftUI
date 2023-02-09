// Create a struct to store information about a car, including
// its model,
// number of seats,
// and current gear,
// then add a method to change gears up or down.

struct Car {
    
    static let lowestGear = 1
    static let highestGear = 10
    
    let model: String
    let numberOfSeats: Int
    private var currentGear: Int = 1 {
        didSet {
            print("Current gear value: \(currentGear)")
        }
    }
    
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    
    
    mutating func gearUp () {
        if currentGear < Car.highestGear {
            currentGear+=1
        } else{
            print("Highest gear limit reached")
        }
        
    }
    
    mutating func gearDown () {
        if currentGear > Car.lowestGear {
            currentGear-=1
        } else{
            print("Lowest gear limit reached")
        }
    }
    
    
}


var jazz = Car(model: "Honda Jazz 800", numberOfSeats: 4)
jazz.gearDown()
jazz.gearUp()
jazz.gearUp()
jazz.gearDown()
