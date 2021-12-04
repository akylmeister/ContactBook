//
//  DetailViewController.swift
//  ContactBook
//
//  Created by admin on 02.10.2021.
//

import UIKit
protocol DeleteProtocol {
    func deleteContact(index: Int)
}
class DetailViewController: UIViewController {
    
    var name_surname: String?
    var phone_number: String?
    var image: UIImage?
    var delegate: DeleteProtocol?
    var index: Int?
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var imageImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = name_surname
        phoneNumberLabel.text = phone_number
        imageImage.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func callPressed(_ sender: Any) {
        print("Calling...")
    }
    @IBAction func deletePressed(_ sender: UIButton) {
        delegate?.deleteContact(index: index!)
        navigationController?.popViewController(animated: true)
    }
    
    

    
//     MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue"{
            let destination = segue.destination as! EditViewController
            destination.name_surname = name_surname
            destination.phone_num = phone_number
            destination.imageFrom = image
            destination.index = index
//            destination.delegate = self
        }
    }
    

}
