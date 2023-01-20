// Write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:
//
// You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.

// If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
// You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
// If you can’t find the square root, throw a “no root” error.
// As a reminder, if you have number X, the square root of X will be another number that, when multiplied by itself, gives X. So, the square root of 9 is 3, because 3x3 is 9, and the square root of 25 is 5, because 5x5 is 25.

enum sqrtErrors: Error {
    case outOfBounds
    case noRootFound
}

func findSqrt(of number: Int) throws -> Int{
    
    if (number < 1 || number > 10_000){
        throw sqrtErrors.outOfBounds
    }
    
    for i in 1...100{
        if (i*i == number){
            print("Square root of \(number) is \(i)")
            return i
        }
    }
    throw sqrtErrors.noRootFound
}

do{
    let test1 = try findSqrt(of: 9)
} catch{
    print("Error: \(error)")
}

