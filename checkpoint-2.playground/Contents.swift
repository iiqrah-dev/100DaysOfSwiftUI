// Create an array of strings
// then write some code that prints the number of items in the array
// and also the number of unique items in the array


let names = ["Iqrah", "Natasha", "Sam", "Joel", "Kareema", "Sam", "Tom"]

print("Total number of items in the array: \(names.count)")

let setOfNames = Set(names)
print("Total number of unique items in the array: \(setOfNames.count)")
