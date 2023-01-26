
// Your input is this:
//
// let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
// Your job is to:
//
// 1. Filter out any numbers that are even
// 2. Sort the array in ascending order
// 3. Map them to strings in the format “7 is a lucky number”
// 4. Print the resulting array, one item per line
//
// Use: sorted(), filter(), map()

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

//print(luckyNumbers.filter{!($0%2==0)})
//print(luckyNumbers.sorted())
//print(luckyNumbers.map{"\($0) is a lucky number"})

let result = luckyNumbers
    .filter { !($0 % 2 == 0) }
    .sorted()
    .map { "\($0) is a lucky number" }

for statement in result {
    print(statement)
}



