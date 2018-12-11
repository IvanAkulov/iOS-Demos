//
//  UIDevice+extensions.swift
//  IPhoneANDIPad
//
//  Created by Ivan Akulov on 11/12/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

extension UIDevice {
    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
    
    static var isCarPlay: Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }
}
