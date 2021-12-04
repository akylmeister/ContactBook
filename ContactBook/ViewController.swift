//
//  ViewController.swift
//  ContactBook
//
//  Created by admin on 02.10.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,SaveProtocol, DeleteProtocol{
  
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var noContacts: UILabel!
    
    var contacts = [Contact.init("Akyl Temirgaliyev","87473889519",UIImage.init(named: "male")!),
                    Contact.init("Kylie Jenner","87028299709",UIImage.init(named: "female")!)]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? TableViewCell
        cell?.contactName.text = contacts[indexPath.row].name_surname
        cell?.contactPhoneNumber.text = contacts[indexPath.row].phone_number
        cell?.contactImageView.image = contacts[indexPath.row].image
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myTableView.beginUpdates()
            contacts.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .fade)
            if contacts.count == 0 {
                noContacts.isHidden = false
                myTableView.isHidden = true
            } else {
                noContacts.isHidden = true
                myTableView.isHidden = false
            }
            myTableView.endUpdates()
        }
    }
    func noCont() {
        if contacts.count == 0 {
            noContacts.text = "No Contacts"
        } else {
            noContacts.text = ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if contacts.count == 0 {
            noContacts.isHidden = false
            myTableView.isHidden = true
        } else {
            noContacts.isHidden = true
            myTableView.isHidden = false
        }
    }
    
    func saveNewContact(name: String, phone_number num: String, gender gen: String) {
        noContacts.isHidden = true
        myTableView.isHidden = false
        if(gen == "Female" && name != "" && num != "") {
            contacts.append(Contact.init(name, num, UIImage.init(named: "female")!))
        }else if (gen == "Male" && name != "" && num != ""){
           contacts.append(Contact.init(name, num, UIImage.init(named: "male")!))
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Please fill the fields and try again!", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        myTableView.reloadData()
    }
    func deleteContact(index: Int) {
        contacts.remove(at: index)
        myTableView.reloadData()
        if contacts.count == 0 {
            noContacts.isHidden = false
            myTableView.isHidden = true
        } else {
            noContacts.isHidden = true
            myTableView.isHidden = false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "infoSegue"{
            let index = (myTableView.indexPathForSelectedRow?.row)!
            let destination = segue.destination as! DetailViewController
            destination.name_surname = contacts[index].name_surname
            destination.phone_number = contacts[index].phone_number
            destination.image = contacts[index].image
            destination.index = index
            destination.delegate = self
        }
        if let deg = segue.destination as? AddingViewController {
            deg.delegate = self
        }
    }

}

