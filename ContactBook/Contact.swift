//
//  Contact.swift
//  ContactBook
//
//  Created by admin on 02.10.2021.
//

import Foundation
import UIKit

class Contact{
    var name_surname: String?
    var phone_number: String?
    var image: UIImage?
    init(_ name_surname: String, _ phone_number: String, _ image: UIImage) {
        self.name_surname = name_surname
        self.phone_number = phone_number
        self.image = image
    }
        
}
