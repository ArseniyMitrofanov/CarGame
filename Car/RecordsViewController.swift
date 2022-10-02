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
        // рекорды
        let recordsArr = UserDefaults.standard.array(forKey: "recordsArr") as? [[String]]
        for i in 0...9 {
            let record = UILabel()
            record.font = .systemFont(ofSize: 30)
            record.textColor = .white
            let part1 = "  " + String(i+1) + ": " + (recordsArr?[i][0])!
            let part2 = " - " + (recordsArr?[i][1])!
            record.text = part1 + part2
            recordsStackView.addArrangedSubview(record)
        }
        recordsStackView.layer.borderWidth = 2
        recordsStackView.layer.borderColor = UIColor.white.cgColor
        recordsStackView.layer.cornerRadius = 20
    }
    // настройки
    @IBAction func buttonSettingsTapped(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyBoard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        settingsViewController.modalPresentationStyle = .fullScreen
        self.present(settingsViewController, animated: true)
    }
    // новая игра
    @IBAction func buttonNewGameTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
