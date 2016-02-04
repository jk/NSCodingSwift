//
//  DummyClass.swift
//  NSCodingProtocol
//
//  Created by Jens Kohl on 29.01.16.
//  Copyright © 2016 Jens Kohl. All rights reserved.
//

import Foundation

class DummyClass: NSObject, NSCoding, MyProtocol {
    var myDescription: String {
        return "Some description"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
//        aCoder.encodeObject(myDescription, forKey: "myDescription")
        // does need to do anything since myDescription is computed property
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        guard let desc = aDecoder.decodeObjectForKey("myDescription") as String else { return nil }
        super.init()
    }
}
