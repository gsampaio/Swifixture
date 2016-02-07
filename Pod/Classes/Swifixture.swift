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

extension String{
    public func loadJSON() throws -> JSON?{
        let bundle = NSBundle.mainBundle()
        
        guard let path = bundle.pathForResource(self, ofType: "json") else{
            throw SwifixtureError.InvalidPath
        }
        
        let pathUrl = NSURL(fileURLWithPath: path)
        do{
            let data = try NSData(contentsOfURL: pathUrl, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            return JSON(data: data)
        }catch {
            throw SwifixtureError.ParseError
        }
    }
}
