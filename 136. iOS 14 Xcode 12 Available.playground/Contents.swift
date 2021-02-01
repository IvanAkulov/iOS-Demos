import UIKit

// available
/*
 * iOS
 * iOSApplicationExtension
 * macOS
 * macOSApplicationExtension
 * macCatalyst
 * macCatalystApplicationExtension
 * watchOS
 * watchOSApplicationExtension
 * tvOS
 * tvOSApplicationExtension
 * swift
 */

@available(iOS 14, *)
func get() {
    // implementation
}

@available(iOS 14, *)
class ExampleClass {
    // ...
}


if #available(iOS 14, *) {
    get()
} else {
    // Fallback on earlier versions
}

@available(iOS, deprecated: 12, obsoleted: 13, message: "iOS 14 has new implementation")
func getTwo() {
    
}

getTwo()

// unavailable
@available(*, unavailable, renamed: "newLaunchApp")
func launchApp() {
    
}

func newLaunchApp() {
    
}

launchApp()
