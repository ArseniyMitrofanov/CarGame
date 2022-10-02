//
//  SettingsViewController.swift
//  Car
//
//  Created by Арсений on 2.10.22.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myCarImage1: UIButton!
    @IBOutlet weak var myCarImage3: UIButton!
    @IBOutlet weak var myCarImage2: UIButton!
    override func viewDidLoad() {
        textField.delegate = self
        if UserDefaults.standard.string(forKey: "userName") != nil {
            userName.text = UserDefaults.standard.string(forKey: "userName")
        } else {
            userName.text = "Аноним"
        }
        switch UserDefaults.standard.string(forKey: "myCar"){
        case "myCar1": myCarImage1.layer.borderWidth = 2
        case "myCar2": myCarImage2.layer.borderWidth = 2
        case "myCar3": myCarImage3.layer.borderWidth = 2
        default :  myCarImage1.layer.borderWidth = 2
        }
        myCarImage1.layer.borderColor = UIColor.white.cgColor
        myCarImage1.layer.cornerRadius = 20
        myCarImage2.layer.borderColor = UIColor.white.cgColor
        myCarImage2.layer.cornerRadius = 20
        myCarImage3.layer.borderColor = UIColor.white.cgColor
        myCarImage3.layer.cornerRadius = 20
    }
    @IBAction func buttonBackTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userName.text = textField.text
        UserDefaults.standard.set(textField.text, forKey: "userName")
        view.endEditing(true)
        return true
    }
    @IBAction func image1Tapped(_ sender: Any) {
        myCarImage1.layer.borderWidth = 2
        myCarImage2.layer.borderWidth = 0
        myCarImage3.layer.borderWidth = 0
        UserDefaults.standard.set("myCar1", forKey: "myCar")
    }
    @IBAction func image2Tapped(_ sender: Any) {
        myCarImage2.layer.borderWidth = 2
        myCarImage1.layer.borderWidth = 0
        myCarImage3.layer.borderWidth = 0
        UserDefaults.standard.set("myCar2", forKey: "myCar")
    }
    @IBAction func image3Tapped(_ sender: Any) {
        myCarImage3.layer.borderWidth = 2
        myCarImage1.layer.borderWidth = 0
        myCarImage2.layer.borderWidth = 0
        UserDefaults.standard.set("myCar3", forKey: "myCar")
    }
}
