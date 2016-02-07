# Swifixture

[![Twitter: @tplioy](https://img.shields.io/badge/contact-@tplioy-blue.svg?style=flat)](https://twitter.com/tplioy)
[![CI Status](http://img.shields.io/travis/thiagolioy/Swifixture.svg?style=flat)](https://travis-ci.org/thiagolioy/Swifixture)
[![Version](https://img.shields.io/cocoapods/v/Swifixture.svg?style=flat)](http://cocoapods.org/pods/Swifixture)
[![License](https://img.shields.io/cocoapods/l/Swifixture.svg?style=flat)](http://cocoapods.org/pods/Swifixture)
[![Platform](https://img.shields.io/cocoapods/p/Swifixture.svg?style=flat)](http://cocoapods.org/pods/Swifixture)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```ruby
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
```

## Requirements

## Installation

Swifixture is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Swifixture"
```

## Author

Thiago Lioy, thiagolioy@gmail.com

## License

Swifixture is available under the MIT license. See the LICENSE file for more info.
