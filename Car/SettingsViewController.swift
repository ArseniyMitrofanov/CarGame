//
//  SettingsViewController.swift
//  Car
//
//  Created by Арсений on 2.10.22.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var anyCarImage3: UIButton!
    @IBOutlet weak var anyCarImage2: UIButton!
    @IBOutlet weak var anyCarImage1: UIButton!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var myCarImage1: UIButton!
    @IBOutlet weak var myCarImage3: UIButton!
    @IBOutlet weak var myCarImage2: UIButton!
    override func viewDidLoad() {
        // имя гонщика
        textField.delegate = self
        if UserDefaults.standard.string(forKey: "userName") != nil {
            userName.text = UserDefaults.standard.string(forKey: "userName")
        } else {
            userName.text = "Аноним"
        }
        // цвет нащей машины
        switch UserDefaults.standard.string(forKey: "myCar") {
        case "myCar1": myCarImage1.layer.borderWidth = 2
        case "myCar2": myCarImage2.layer.borderWidth = 2
        case "myCar3": myCarImage3.layer.borderWidth = 2
        default :  myCarImage1.layer.borderWidth = 2
        }
        // цвет препятствия
        switch UserDefaults.standard.string(forKey: "anyCar") {
        case "anyCar1": anyCarImage1.layer.borderWidth = 2
        case "anyCar2": anyCarImage2.layer.borderWidth = 2
        case "anyCar3": anyCarImage3.layer.borderWidth = 2
        default :  anyCarImage1.layer.borderWidth = 2
        }
        // то что нельзя сделать в сториборде
        myCarImage1.layer.borderColor = UIColor.white.cgColor
        myCarImage1.layer.cornerRadius = 20
        myCarImage2.layer.borderColor = UIColor.white.cgColor
        myCarImage2.layer.cornerRadius = 20
        myCarImage3.layer.borderColor = UIColor.white.cgColor
        myCarImage3.layer.cornerRadius = 20
        anyCarImage1.layer.borderColor = UIColor.white.cgColor
        anyCarImage1.layer.cornerRadius = 20
        anyCarImage2.layer.borderColor = UIColor.white.cgColor
        anyCarImage2.layer.cornerRadius = 20
        anyCarImage3.layer.borderColor = UIColor.white.cgColor
        anyCarImage3.layer.cornerRadius = 20
    }
    // назад к рекордам
    @IBAction func buttonBackTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    // ввод имени
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userName.text = textField.text
        UserDefaults.standard.set(textField.text, forKey: "userName")
        view.endEditing(true)
        return true
    }
    // далее выборы нашей машины
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
    // далее выборы препятствия
    @IBAction func anyImage1Tapped(_ sender: Any) {
        anyCarImage1.layer.borderWidth = 2
        anyCarImage2.layer.borderWidth = 0
        anyCarImage3.layer.borderWidth = 0
        UserDefaults.standard.set("anyCar1", forKey: "anyCar")
    }
    @IBAction func anyImage2Tapped(_ sender: Any) {
        anyCarImage2.layer.borderWidth = 2
        anyCarImage1.layer.borderWidth = 0
        anyCarImage3.layer.borderWidth = 0
        UserDefaults.standard.set("anyCar2", forKey: "anyCar")
    }
    @IBAction func anyImage3Tapped(_ sender: Any) {
        anyCarImage3.layer.borderWidth = 2
        anyCarImage1.layer.borderWidth = 0
        anyCarImage2.layer.borderWidth = 0
        UserDefaults.standard.set("anyCar3", forKey: "anyCar")
    }
}
