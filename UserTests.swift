/** What is an object? (Usually we get answers such as:)
 - It's a reference type: a value in memory referenced by a pointer or an identifier
 What can we do with objects?
 - We can encapsulate data and we can expose methods to manipulate the data
 What else?
 - We can enable polymorphism through inheritance
 How do we create such objects?
 - You need an object-oriented language, you need the 'class' keyword to define the object interface or template, and then you initialize the object using the class template and you pass an initial state
 
 Let's put those ideas in practice
 */

import XCTest
@testable import Objects

class UserTests: XCTestCase {
    // 1, test, create function, compile, fail, create function, pass test
    func testFullnameIsTheCombinationOfFirstAndLastName() {
        let sut = makeUser(firstname: "Paulo", lastname: "Silva")
        XCTAssertEqual(sut.fullname(), "Paulo Silva")
    }
    
    // 2 make firstname var, pass the test
    func testCanUpdateFirstname() {
        let sut = makeUser(firstname: "Paulo", lastname: "Silva")
        // 11
        //sut.set(firstname: "Paula")
        sut.setFirstname("Paula")
        XCTAssertEqual(sut.fullname(), "Paula Silva")
        // 12 it won't pass the tests because we haven't implemented the setFirstname method yet

    }
    
    // 3 create class template for PremiumUser, nothing else and test
    
    /**It fails!! but we didn't get any compiler error!! Because the Premium User inherits all of the methods from its parent class, including the initializer and all the other constraints, so we are getting all the behavior from the super class. So to change the behavior of the new class, I need to override the method*/
    func testPremiumUserAppendsAStarToTheFullName() {
        let sut = makePremiumUser(firstname: "Paulo", lastname: "Silva")
        XCTAssertEqual(sut.fullname(), "Paulo Silva ⭐️") // it's a Premium User

    }
    
    // 5 we got this behavior for free!
    func testCanUpdateFirstnameOfAPremiumUser() {
        let sut = makePremiumUser(firstname: "Paulo", lastname: "Silva")
        sut.setFirstname("Paula")
        XCTAssertEqual(sut.fullname(), "Paula Silva ⭐️")
    }
    /** 6 Now the question is: Do we need the class keyword to define an object? To create an object, do I need an object oriented language? Can we have all these behaviors without the class keyword?
     */
    // 7 let's do some refactoring here
    
    // MARK: - Helpers
    //10
//    private func makeUser(firstname: String, lastname: String) -> User {
//        return User(firstname: firstname, lastname: lastname)
//    }
    
    // 14
//    private func makePremiumUser(firstname: String, lastname: String) -> PremiumUser {
//        return PremiumUser(firstname: firstname, lastname: lastname)
//    }
    // 8 change lines 19, 25 with makeUser() and 35, 42 with makePremiumUser
    
    // 9 now let's try to re-create this behavior without the class keyword, let's start with the initializer, which looks like a function that receives 2 parameters
    
    // 11 replace User with makeUser in the tests
    private func makeUser(firstname: String, lastname: String) -> User {//(setFirstname: (String) -> Void, fullname: () -> String) {
        return makeUserObject(firstname: firstname, lastname: lastname)
    }
    
    // 14 chage Premium user type and setFirsname
    private func makePremiumUser(firstname: String, lastname: String) -> PremiumUser {//(setFirstname: (String) -> Void, fullname: () -> String) {
        return makePremiumUserObject(firstname: firstname, lastname: lastname)
    }
    
    // 15 all the tests pass but there is a lot of repetition, we are implementing the setFirstname again and in the previous implementation, we were getting those things for free with inheritance. So how can we have polymorphism without the class keyword? Or without inheritance? Let's try something...
    
}
