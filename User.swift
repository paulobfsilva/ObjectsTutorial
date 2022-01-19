//
//  User.swift
//  Objects
//
//  Created by Paulo Silva on 18/01/2022.
//

import Foundation

//class User {
//    private var firstname: String //data
//    private let lastname: String
//
//    init(firstname: String, lastname: String) {
//        self.firstname = firstname
//        self.lastname = lastname
//    }
//
//    //2 we are performing operations in this class that mutate the internal state through methods or messages, rather than exposing directly the data
//    func set(firstname: String) {
//        self.firstname = firstname
//    }
//
//    //internal function exposing data
//    func fullname() -> String {
//        return firstname + " " + lastname
//    }
//}
//
//// 3 Now let's investigate inheritance
//
//class PremiumUser: User {
//    // 4 build and run the test
//    override func fullname() -> String {
//        return super.fullname() + " ⭐️"
//    }
//}

//9 this function needs to return something that exposes methods, just like an object do... right now we have a set method and a fullname method, so let's return a tuple with a setFirstname closure that receives a String and returns Void, and another called fullname like in the class

// 19
typealias User = (setFirstname: (String) -> Void, fullname: () -> String)
func makeUserObject(firstname: String, lastname:String) -> User { //(setFirstname: (String) -> Void, fullname: () -> String) /* tuple */ {
    
    // 12 create a local variable to mutate the first name
    var _firstname = firstname
    
    // let's return the tuple
    return (setFirstname: { newFirstName in
        // 12
        _firstname = newFirstName
    },
            fullname: {
        // 12
        //return firstname + " " + lastname
        return _firstname + " " + lastname
    })
    // 10 it compiles, so let's try to replace our User class instance with the new makeUserObject function type (replace User with makeUserObject in the factory methods and the return type to the same signature
}

// 13 Let's do the same thing for the Premium User object

// 19
typealias PremiumUser = (setFirstname: (String) -> Void, fullname: () -> String)

func makePremiumUserObject(firstname: String, lastname:String) -> PremiumUser {//(setFirstname: (String) -> Void, fullname: () -> String) {
    // 16 what if we create a user here
    //var _firstname = firstname
    let _super = makeUserObject(firstname: firstname, lastname: lastname)
    
    // 16 and we return a tuple again
//    return (setFirstname: { newFirstName in
//        _firstname = newFirstName
//    },
//            fullname: {
//        // 14 and let's replace it in the test usages
//        return _firstname + " " + lastname + " ⭐️"
//    })
    
    // 16
    return (
        setFirstname: _super.setFirstname,
        fullname: {
            return _super.fullname() + " ⭐️"
        }
    ) // make _user a let
    
    // 17 look how close this looks to the Premium User class implementation. What if we call _user something else, let's say _super? Does it make sense now?
    // 18 let's delete the class based solution
    // 19 let's do some refactoring now...
    // 20 tests are passing and we have created an object without the class keyword, because that's what this really is: an object is a concept, and OOP make it a first class citizen, and we have the class keyword to define those interfaces and templates, inheritance and all of that, but an object can also be just data, and a function if we understand what an object really is.
}
