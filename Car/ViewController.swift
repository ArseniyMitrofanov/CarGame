//
//  ViewController.swift
//  Car
//
//  Created by Арсений on 10.09.22.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var myCar: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var road: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var score = 0
        // разметка
        let plateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            let plate = UIView()
            plate.backgroundColor = .white
            plate.frame  = CGRect(x: 158, y: -100, width: 25, height: 100)
            self.road.addSubview(plate)
            self.road.bringSubviewToFront(self.myCar)
            UIView.animate(withDuration: 4,
                           delay: 0,
                           options: [.curveLinear]) {
                plate.frame.origin.y += 1100
            } completion: { _ in
                plate.removeFromSuperview()
            }
        }
        // anyCar
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
            let anyCar = UIImageView(image: UIImage(named: "anyCar"))
            let set = Int.random(in: 0...1)
            switch set {
            case 0:
                anyCar.frame  = CGRect(x: 56, y: -200, width: 100, height: 200)
            default:
                anyCar.frame  = CGRect(x: 240, y: -200, width: 100, height: 200)
            }
            self.view.addSubview(anyCar)
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { crashTimer in
                anyCar.frame.origin.y += 4
                // crash
                if anyCar.frame.intersects(self.myCar.frame) {
                    print("your score is", score)
                    crashTimer.invalidate()
                    timer.invalidate()
                    plateTimer.invalidate()
                    anyCar.removeFromSuperview()
                    self.myCar.image = UIImage(named: "fire")
                    self.button.removeFromSuperview()
                    self.endGame()
                }
                // not crash
                if anyCar.frame.origin.y > 1100 {
                    score += 1
                    print(score)
                    crashTimer.invalidate()
                    anyCar.removeFromSuperview()
                }
            }
        }
    }
    @IBAction func go(_ sender: UIButton) {
        sender.isEnabled = false
        if self.myCar.frame.origin.x < 150 {
            // go right
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                self.myCar.frame.origin.x += 4
                if self.myCar.frame.origin.x == 213 {
                    timer.invalidate()
                    sender.isEnabled = true
                }
            }
        } else {
            // go left
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
                self.myCar.frame.origin.x -= 4
                if self.myCar.frame.origin.x == 29 {
                    timer.invalidate()
                    sender.isEnabled = true
                }
            }
        }
    }
    func endGame() {
        Timer.scheduledTimer(withTimeInterval: 1.9, repeats: false) { _ in
            let crashLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
            crashLabel.center = self.view.center
            crashLabel.layer.borderColor = UIColor.white.cgColor
            crashLabel.layer.borderWidth = 2
            crashLabel.layer.cornerRadius = 20
            crashLabel.textAlignment = .center
            crashLabel.textColor = .white
            crashLabel.font = .systemFont(ofSize: 30)
            crashLabel.text = "Авария!"
            self.view.addSubview(crashLabel)
        }
        Timer.scheduledTimer(withTimeInterval: 4, repeats: false) { _ in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let recordsViewController = storyBoard.instantiateViewController(withIdentifier: "RecordsViewController") as! RecordsViewController
            recordsViewController.modalPresentationStyle = .fullScreen
            self.present(recordsViewController, animated: true)
        }
        
    }
}
