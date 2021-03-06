//
//  AppDelegate.swift
//  NSCodingProtocol
//
//  Created by Jens Kohl on 29.01.16.
//  Copyright © 2016 Jens Kohl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

//        let a: [MyProtocol] = [DummyClass(), DummyClass()]
//        
//        let c = MyClass(myCollection: a)
//        for dummy in c.myCollection {
//            print(dummy.myDescription)
//        }
//        
//        NSKeyedArchiver.archiveRootObject(c, toFile: MyClass.ArchiveURL.path!)
//        
//        let d = NSKeyedUnarchiver.unarchiveObjectWithFile(MyClass.ArchiveURL.path!) as! MyClass
//        for dummy in d.myCollection {
//            print(dummy.myDescription)
//        }
        
        let a = MyEnum.None
        let b = MyEnumClass(myEnum: a)
        print("Original \(b.myEnum.rawValue)")
        
        NSKeyedArchiver.archiveRootObject(b, toFile: MyEnumClass.ArchiveURL.path!)
        
        let c = NSKeyedUnarchiver.unarchiveObjectWithFile(MyEnumClass.ArchiveURL.path!) as! MyEnumClass
        print("Rescued \(c.myEnum.rawValue)")
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

