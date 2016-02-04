//
//  MyClass.swift
//  NSCodingProtocol
//
//  Created by Jens Kohl on 29.01.16.
//  Copyright © 2016 Jens Kohl. All rights reserved.
//

import Foundation

class MyClass: NSObject, NSCoding {
    let myCollection: [MyProtocol]
    
    init(myCollection: [MyProtocol]) {
        self.myCollection = myCollection
        
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
//        let collection1 = aDecoder.decodeObjectForKey("collection") as! [AnyObject]
//        let collection2: [MyProtocol] = collection1.map { $0 as! MyProtocol }
        let coll3: [MyProtocol] = aDecoder.decodeObjectForKey("collection2")
        
        self.init(myCollection: coll3)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
//        let aCollection: [AnyObject] = myCollection.map { $0 as! AnyObject }
//        print("outside: \(aCollection)")
//        print("outside: \(aCollection.dynamicType)")
//            print(myCollection.dynamicType)
//        aCoder.encodeObject(aCollection, forKey: "collection")
        
        aCoder.encodeProtocol(myCollection, forKey: "collection2")
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("dummies")
    
}
