//
//  AppDelegate.swift
//  IPhoneANDIPad
//
//  Created by Ivan Akulov on 11/12/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = storyboard.instantiateInitialViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private var storyboard: UIStoryboard {
        enum StoryboardType: String {
            case iPhone = "IPhone"
            case iPad = "IPad"
        }
        
        switch UIDevice.current.userInterfaceIdiom {
        case .phone: return UIStoryboard(name: StoryboardType.iPhone.rawValue, bundle: nil)
        case .pad: return UIStoryboard(name: StoryboardType.iPad.rawValue, bundle: nil)
        default: fatalError()
        }
    }
}

// https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions
// https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model

