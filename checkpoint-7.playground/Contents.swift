// Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
//
// But there’s more:
//
// The Animal class should have a legs integer property that tracks how many legs the animal has.
// The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
// The Cat class should have a matching speak() method, again with each subclass printing something different.
// The Cat class should have an isTame Boolean property, provided using an initializer.

class Animal {
    var legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog : Animal {
    
    init() {
        super.init(legs: 4)
    }

    func speak(){
        print("Bark Bark!")
    }
}

class Cat : Animal {
    var isTame: Bool
    
    init(isTame: Bool){
        
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak(){
        print("Meow Meow!")
    }
}

final class Corgi : Dog {
    override func speak(){
        print("Bow Bow!")
    }
}

final class Poodle : Dog {
    override func speak(){
        print("Pow Pow!")
    }
}

final class Persian : Cat {
    override func speak(){
        print("Mew Mew!")
    }
}

final class Lion : Cat {
    override func speak(){
        print("Roar Roar!")
    }
}


let cat1 = Persian(isTame: true)
let cat2 = Lion(isTame: false)
let dog1 = Poodle()
let dog2 = Corgi()

