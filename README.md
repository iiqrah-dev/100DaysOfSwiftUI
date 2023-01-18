# 100DaysOfSwiftUI

[100DaysOfSwiftUI](https://www.hackingwithswift.com/100/swiftui) by [Paul Hudson](https://twitter.com/twostraws)

- [x] Day 1

  - QofTD: "The secret to getting ahead is getting started." - Mark Twain

  - Why Swift and SwiftUI? 
  - Variables and Constants
  - Strings, Integers, Doubles
  
  
- [x] Day 2

  - QofTD: "When the going gets tough, everyone leaves." - Lynch’s Law
  
  - Booleans
  - Working with Strings
    - Concatenation 
    - Interpolation
  - Checkpoint 1 
  
  
- [ ] Day 3

  - QofTD: "Computers are like Old Testament gods: lots of rules and no mercy." - Joseph Campbell
  
  - Arrays [ value1, value2]
    - a way to hold group of similar data type in one place that needs to be in an order, be it list of names (String), scores (Int), temperatures (Double)
    - to refer to a value in an array we use index, starting from 0, e.g. `myArray[0]`
    - to create empty array: `let scores = Array<Int>()` or `let scores = [Int]()`
    - arrays are type safe so you can only mix data by defining it, e.g `let myArray =  ["name", 23, false] as [Any]`
      
    - useful methods:
      - `myArray.append(newValue)`
      - `myArray.count`
      - `myArray.remove(at: 2)`
      - `myArray.removeAll()`
      - `myArray.contains(searchValue)`
      - `myArray.sorted()`
      - `myArray.reversed()`
        - P.S. for reversed() Swift uses an optimisation technique to remember to reverse itself rather than rearranging the items as that will be super slow specially for a super long array
        
  - Dictionaries [key1: value1, key2: value2]
    - another way to hold groups of specific data in one place whose values are linked to the keys, both keys and values may not necessarily be same data type but remain consitent throughout
    - instead of index, the key name is used to access the value, e.g. `myDict[key1]`
      - the key name may or may not exist, so the value is accessed as an optional, one way around this is using a default value, e.g. `myDict[key1, default "Unknown"]`
    - to create empty ditionaries: `let employee = [String: Int]()`
    - dicts are type safe too so you can only mix data by defining it, e.g `let employee = ["name": "Iqrah","age": 23] as [String : Any]`
    
  - Sets ([value1, value2])
    - another way to store groups of data but without any duplicates or an order which is optimised for a really fast lookup. 
    - to add new items, use `mySet.insert()` instead of append
    
  - Enum {case value1, value2}
    - set of developer defined values to make the code more efficient, accurate and safer 
    - e.g : `enum Weekdays { case mon, tue, wed, thu, fri, sat, sun}` 
    - then use `day = Weekdays.mon` instead of `day = "Monday"` to assign a value to `day` variable
    - they are also faster and optimised to store for Swift than Strings


    
