// https://github.com/Quick/Quick

import Quick
import Nimble
import Swifixture

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will pass") {

            it("should be able to load json") {                
                let json = try! "jsonfile".loadJSON()
                expect(json!["prop1"]) == "first prop"
            }
            
            it("should fail if invalid json name is given") {
                expect{try "invalid".loadJSON()}.to(throwError())
            }

        }
    }
}


