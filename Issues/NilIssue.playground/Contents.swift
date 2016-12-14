import Reflection



// MARK: - The issue with nil
struct Person {
    var firstName: String?
    var lastName: String
    var age: Int
}

class PersonClass {
    var firstName: String? = "firstName"
    var lastName: String? = "lastName"
    var age: Int? = 0
}

var smithStruct = Person(firstName: nil, lastName: "Smith", age: 35)
var personClass = PersonClass()

let personClassProperties = try properties(smithStruct)

for property in personClassProperties {
    do {
        ///I want to check if the value is nil
        if (!property.isNilValue) {
            print(property.value)
            try set(property.value, key: property.key, for: &personClass)
        }
    } catch let error {
        print(error)
    }
}


print(smithStruct)
print(personClass.firstName, personClass.lastName, personClass.age)
