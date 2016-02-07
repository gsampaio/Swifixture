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
    
    static func data(fromfile file:String) throws -> NSData?{
        let bundle = NSBundle.mainBundle()
        
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
    
    init(_ name:String){
        filename = name
    }
    
    public func toSwiftyJSON() throws -> JSON?{
        let data = try FixtureLoader.data(fromfile: self.filename)
        return JSON(data: data!)
    }
    
    public func toString() throws -> String?{
        let data = try FixtureLoader.data(fromfile: self.filename)
        return JSON(data: data!).rawString()
    }
    
    public func mapTo<T:Mappable>(type:T.Type) throws -> T?{
        let jsonString = try self.toString()
        let result = Mapper<T>().map(jsonString!)
        return result
    }
}
