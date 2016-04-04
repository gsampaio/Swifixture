//
//  Swifixture.swift
//  Pods
//
//  Created by Thiago Lioy on 2/7/16.
//
//

import Foundation
import SwiftyJSON
import ObjectMapper


public enum SwifixtureError: ErrorType{
    case InvalidPath
    case ParseError
}
struct FixtureLoader {
    
    static func data(fromfile file:String, inBundle bundle:NSBundle) throws -> NSData?{
        guard let path = bundle.pathForResource(file, ofType: "json") else{
            throw SwifixtureError.InvalidPath
        }
        
        let pathUrl = NSURL(fileURLWithPath: path)
        do{
            return try NSData(contentsOfURL: pathUrl, options: NSDataReadingOptions.DataReadingMappedIfSafe)
        }catch {
            throw SwifixtureError.ParseError
        }
    }
    
}

public struct Swifixture {
    let filename: String
    let bundle: NSBundle
    
    public init(_ name:String, inBundle bundle:NSBundle = NSBundle.mainBundle()){
        filename = name
        self.bundle = bundle
    }
    
    public func toSwiftyJSON() throws -> JSON?{
        let data = try FixtureLoader.data(fromfile: self.filename, inBundle:self.bundle)
        return JSON(data: data!)
    }
    
    public func toString() throws -> String?{
        let data = try FixtureLoader.data(fromfile: self.filename, inBundle:self.bundle)
        return JSON(data: data!).rawString()
    }
    
    public func mapTo<T:Mappable>(type:T.Type) throws -> T?{
        let jsonString = try self.toString()
        let result = Mapper<T>().map(jsonString!)
        return result
    }
}
