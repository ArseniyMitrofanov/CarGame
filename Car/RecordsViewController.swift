//
//  RecordsViewController.swift
//  Car
//
//  Created by Арсений on 2.10.22.
//

import UIKit

class RecordsViewController: UIViewController {
    @IBOutlet weak var recordsStackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recordsStackView.layer.borderWidth = 2
        recordsStackView.layer.borderColor = UIColor.white.cgColor
        recordsStackView.layer.cornerRadius = 20
    }
    @IBAction func buttonSettingsTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        settingsViewController.modalPresentationStyle = .fullScreen
        self.present(settingsViewController, animated: true)
    }
    @IBAction func buttonNewGameTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
