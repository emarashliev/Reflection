import CoreData
import Reflection


// MARK: - The issue with NSManagedObject
struct Person {
    var firstName: String
    var lastName: String
    var age: Int
}

class PersonClass {
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 0
}

class PersonNSObject: NSObject {
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 0
    
    override var description : String {
        return " \(firstName) \(lastName) \(age)"
    }
}

class PersonNSManagedObject: NSManagedObject {
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 0
    
    override var description : String {
        return " \(firstName) \(lastName) \(age)"
    }
}

var smithStruct = Person(firstName: "John", lastName: "Smith", age: 35)
var personClass = PersonClass()
var personNSObject = PersonNSObject()
var personNSManagedObject = PersonNSManagedObject()


let smithProperties = try properties(smithStruct)

for property in smithProperties {
    do {
        //Wors perfect with classes
        try set(property.value, key: property.key, for: personClass)
        //Wors perfect with NSObject's
        try set(property.value, key: property.key, for: personNSObject)
        //But DOESN'T works with NSManagedObject's
        try set(property.value, key: property.key, for: personNSManagedObject)
    } catch let error {
        print(error)
    }
}

print(type(of: personClass), personClass.age, personClass.firstName, personClass.lastName)
print(type(of: personNSObject), personNSObject)
print(type(of: personNSManagedObject), personNSManagedObject)


