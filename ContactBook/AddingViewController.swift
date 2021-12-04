//
//  AddingViewController.swift
//  ContactBook
//
//  Created by admin on 03.10.2021.
//

import UIKit

protocol SaveProtocol {
    func saveNewContact(name: String, phone_number: String, gender: String)
}
class AddingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var delegate: SaveProtocol?
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone_number: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var gender: String?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender = pickerData[row]
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["Male","Female"]
    }
    @IBAction func savePressed(_ sender: UIButton) {
            delegate?.saveNewContact(name: name.text!, phone_number: phone_number.text!, gender: gender ?? "Male")
            navigationController?.popViewController(animated: true)
    }

}
