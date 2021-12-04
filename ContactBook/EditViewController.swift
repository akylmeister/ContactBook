//
//  EditViewController.swift
//  ContactBook
//
//  Created by admin on 18.11.2021.
//

import UIKit
protocol EditProtocol{
    func editContact(index: Int,name: String, phone_number: String, gender: String)
}
class EditViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender = pickerData[row]
    }
    
    var delegate: EditProtocol?
    var index: Int?
    var imageFrom: UIImage?
    var name_surname: String?
    var phone_num: String?
    var pickerData: [String] = [String]()
    var gender: String = "male"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone_number: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = imageFrom
        name.text = name_surname
        phone_number.text = phone_num
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        pickerData = ["Male","Female"]
        // Do any additional setup after loading the view.
    }
    @IBAction func savePressed(_ sender: Any) {
        delegate?.editContact(index: index!,name: name.text!, phone_number: phone_number.text!, gender: gender)
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
