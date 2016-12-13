import Reflection


// MARK: - The issue with nil
struct Person {
    var firstName: String
    var lastName: String
    var age: Int
}

class PersonClass {
    var firstName: String? = nil
    var lastName: String? = nil
    var age: Int? = nil
}

var smithStruct = Person(firstName: "John", lastName: "Smith", age: 35)
var personClass = PersonClass()

let personClassProperties = try properties(personClass)

for property in personClassProperties {
    do {
        ///I want to check if the value is nil
        
        //Compile error
/*        if let value = property.value {
            print(type(of: value), property.value)
            try set(value, key: property.key, for: &smithStruct)
        }
*/
        //Warning and throwing Error
        if property.value != nil {
            print(type(of: property.value), property.value)
            try set(property.value, key: property.key, for: &smithStruct)
        }
        
    } catch let error {
        print(error)
    }
}


print(smithStruct)


/// I suggest a Bool property in struct `Property` that indicates that the value if is nil