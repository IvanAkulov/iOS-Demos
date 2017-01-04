//
//  ViewController.swift
//  ContactsAccess
//
//  Created by Ivan Akulov on 26/12/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        CNContactStore().requestAccess(for: .contacts) { (success, error) in
            guard success else {
                print("not authorized error: \(error)")
                return
            }
        }
        
        do {
            
            let predicate = CNContact.predicateForContacts(matchingName: "Свифт")
            var contacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: [
                CNContactFamilyNameKey as CNKeyDescriptor,
                CNContactGivenNameKey as CNKeyDescriptor,
                CNContactPhoneNumbersKey as CNKeyDescriptor
                ])
            
            contacts = contacts.filter{ $0.familyName == ""}
            guard let contact = contacts.first else {
                print("There is no such contact")
                return
            }
            
            if contact.phoneNumbers.count > 0 {
                let number = contact.phoneNumbers[0].value
                label.text = number.stringValue
            
            }
        } catch {
            print(error)
        }
    }
}










