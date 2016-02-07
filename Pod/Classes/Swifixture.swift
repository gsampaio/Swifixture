//
//  Swifixture.swift
//  Pods
//
//  Created by Thiago Lioy on 2/7/16.
//
//

import Foundation
import SwiftyJSON


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

extension String{
    public func loadJSON() throws -> JSON?{
        let data = try FixtureLoader.data(fromfile: self)
        return JSON(data: data!)
    }
}
