//
//  NSCoder+Swift.swift
//  NSCodingProtocol
//
//  Created by Jens Kohl on 01.02.16.
//  Copyright © 2016 Jens Kohl. All rights reserved.
//

import Foundation

extension NSCoder {
    
    // MARK: - Enum
    // MARK: String
    /**
    Encode a String backed Enum
    
    - parameter value: Enum instance
    - parameter key:   Identifier
    */
    func encodeEnum<Enum: RawRepresentable where Enum.RawValue == String>(value: Enum, forKey key: String) {
        self.encodeObject(value.rawValue, forKey: key)
    }
    
    /**
     Decode a String backed Enum
     
     - parameter key: Identifier
     
     - returns: Decoded Enum instance
     */
    func decodeEnumForKey<Enum: RawRepresentable where Enum.RawValue == String>(key: String) -> Enum? {
        guard let returnValue = self.decodeObjectForKey(key) as? Enum.RawValue else { return nil }
        
        return Enum(rawValue: returnValue)
    }
    
    // MARK: Int
    /**
    Encode a Int backed Enum
    
    - parameter value: Enum instance
    - parameter key:   Identifier
    */
    func encodeEnum<Enum: RawRepresentable where Enum.RawValue == Int>(value: Enum, forKey key: String) {
        self.encodeInteger(value.rawValue, forKey: key)
    }
    
    /**
     Decode a Int backed Enum
     
     - parameter key: Identifier
     
     - returns: Decoded Enum instance
     */
    func decodeEnumForKey<Enum: RawRepresentable where Enum.RawValue == Int>(key: String) -> Enum? {
        return Enum(rawValue: self.decodeIntegerForKey(key))
    }
    
    // MARK: Float
    /**
    Encode a Float backed Enum
    
    - parameter value: Enum instance
    - parameter key:   Identifier
    */
    func encodeEnum<Enum: RawRepresentable where Enum.RawValue == Float>(value: Enum, forKey key: String) {
        self.encodeFloat(value.rawValue, forKey: key)
    }
    
    /**
     Decode a Float backed Enum
     
     - parameter key: Identifier
     
     - returns: Decoded Enum instance
     */
    func decodeEnumForKey<Enum: RawRepresentable where Enum.RawValue == Float>(key: String) -> Enum? {
        return Enum(rawValue: self.decodeFloatForKey(key))
    }
    
    // MARK: Double
    /**
    Encode a Double backed Enum
    
    - parameter value: Enum instance
    - parameter key:   Identifier
    */
    func encodeEnum<Enum: RawRepresentable where Enum.RawValue == Double>(value: Enum, forKey key: String) {
        self.encodeDouble(value.rawValue, forKey: key)
    }
    
    /**
     Decode a Double backed Enum
     
     - parameter key: Identifier
     
     - returns: Decoded Enum instance
     */
    func decodeEnumForKey<Enum: RawRepresentable where Enum.RawValue == Double>(key: String) -> Enum? {
        return Enum(rawValue: self.decodeDoubleForKey(key))
    }
    
    // MARK: - Protocol
    /**
    Encode an Array of objects which can conform to a Protocol
    
    - parameter objv: Array of objects
    - parameter key:  Identifier
    */
    func encodeProtocol<T: SequenceType>(objv: T, forKey key: String) {
        let aCollection = objv.map { $0 as! AnyObject }
        self.encodeObject(aCollection, forKey: key)
    }
    
    /**
     Decode an Array of objects which can conform to a Protocol
     
     - parameter key: Identifier
     
     - returns: Array of objects
     */
    func decodeObjectForKey<T>(key: String) -> [T] {
        let unspecifiedCollection = self.decodeObjectForKey(key) as! [AnyObject]
        return unspecifiedCollection.map { $0 as! T }
    }
}
