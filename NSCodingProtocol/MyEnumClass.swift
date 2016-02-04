//
//  MyEnumClass.swift
//  NSCodingProtocol
//
//  Created by Jens Kohl on 01.02.16.
//  Copyright © 2016 Jens Kohl. All rights reserved.
//

import Foundation

class MyEnumClass: NSObject, NSCoding {
    let myEnum: MyEnum
    
    init(myEnum: MyEnum) {
        self.myEnum = myEnum
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard
            let tmp = aDecoder.decodeEnumForKey(NSCodingKeys.myEnum) as MyEnum?
        else { return nil }
        
        self.init(myEnum: tmp)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeEnum(myEnum, forKey: NSCodingKeys.myEnum)
    }
    
    struct NSCodingKeys {
        static let myEnum = "myEnum"
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("myenum")
}
