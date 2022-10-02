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
}
