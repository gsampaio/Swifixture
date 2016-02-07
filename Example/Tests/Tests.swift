// https://github.com/Quick/Quick

import Quick
import Nimble
import Swifixture
import ObjectMapper

struct FixtureObjectMapper: Mappable {
    var prop1: String?
    var prop2: String?
    
    init?(_ map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        prop1 <- map["prop1"]
        prop2 <- map["prop2"]
    }
}

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will pass") {

            it("should be able to load json") {
                let json = try! Swifixture("jsonfile").toSwiftyJSON()
                expect(json!["prop1"]) == "first prop"
            }
            
            it("should be able to map string to obj") {
                let object = try! Swifixture("jsonfile").mapTo(FixtureObjectMapper)
                expect(object!.prop1) == "first prop"
                expect(object!.prop2) == "second prop"
            }
            
            it("should be able to load json string") {
                let string = try! Swifixture("simple").toString()
                expect(string).toNot(beNil())
                
            }
            

        }
        
        describe("these will fail") {
            it("should fail if invalid json name is given") {
                expect{try Swifixture("invalid").toSwiftyJSON()}.to(throwError())
            }
        }
    }
}


