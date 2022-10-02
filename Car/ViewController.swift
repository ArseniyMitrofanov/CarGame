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
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // в начале исп. приложения зануляю значения таблицы рекордов чтоб не делать их опциональными, в будущем этой проверки не будет так как будут уже реальные значения рекордов :)
        var recordsArr : [[String]] = [[],[],[],[],[],[],[],[],[],[]] // dont ask why
        if UserDefaults.standard.string(forKey: "firstTimeInApp?") == nil {
            UserDefaults.standard.set("No", forKey: "firstTimeInApp?")
            for i in 0...9 {
                recordsArr[i] = ["0","Разработчик"]
            }
            UserDefaults.standard.set(recordsArr, forKey: "recordsArr")
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        score = 0
        // цвет нашей машины
        switch UserDefaults.standard.string(forKey: "myCar") {
        case "myCar1": myCar.image = UIImage(named: "myCar1")
        case "myCar2": myCar.image = UIImage(named: "myCar2")
        case "myCar3": myCar.image = UIImage(named: "myCar3")
        default : myCar.image = UIImage(named: "myCar1")
        }
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
            let anyCar = UIImageView()
            // цвет
            switch UserDefaults.standard.string(forKey: "anyCar") {
            case "anyCar1": anyCar.image = UIImage(named: "anyCar1")
            case "anyCar2": anyCar.image = UIImage(named: "anyCar2")
            case "anyCar3": anyCar.image = UIImage(named: "anyCar3")
            default : anyCar.image = UIImage(named: "anyCar1")
            }
            // левая или правая сторона
            let set = Int.random(in: 0...1)
            switch set {
            case 0:
                anyCar.frame  = CGRect(x: 56, y: -200, width: 100, height: 200)
            default:
                anyCar.frame  = CGRect(x: 240, y: -200, width: 100, height: 200)
            }
            self.view.addSubview(anyCar)
            // передвижение машины
            Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { crashTimer in
                anyCar.frame.origin.y += 4
                // crash
                if anyCar.frame.intersects(self.myCar.frame) {
                    crashTimer.invalidate()
                    timer.invalidate()
                    plateTimer.invalidate()
                    anyCar.removeFromSuperview()
                    self.myCar.image = UIImage(named: "fire")
                    self.endGame()
                    self.saveRecordIfNeeded(score: self.score)
                }
                // not crash
                if anyCar.frame.origin.y > 1100 {
                    self.score += 1
                    crashTimer.invalidate()
                    anyCar.removeFromSuperview()
                }
            }
        }
    }
    // перестроение нашей машины
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
    // вывеска с счетом и переход к рекордам
    func endGame() {
        let crashLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        Timer.scheduledTimer(withTimeInterval: 1.9, repeats: false) { _ in
            crashLabel.center = self.view.center
            crashLabel.layer.borderColor = UIColor.white.cgColor
            crashLabel.layer.borderWidth = 2
            crashLabel.layer.cornerRadius = 20
            crashLabel.numberOfLines = 2
            crashLabel.textAlignment = .center
            crashLabel.textColor = .white
            crashLabel.font = .systemFont(ofSize: 30)
            crashLabel.text = "Авария! \n счет: " + String(self.score)
            self.view.addSubview(crashLabel)
        }
        // переход к экрану рекордов
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let recordsViewController = storyBoard.instantiateViewController(withIdentifier: "RecordsViewController") as! RecordsViewController
            recordsViewController.modalPresentationStyle = .fullScreen
            self.present(recordsViewController, animated: true)
            crashLabel.removeFromSuperview()
        }
    }
    // сравнение запись и сортировка рекордов
    func saveRecordIfNeeded(score: Int) {
        var userName = "Аноним"
        if UserDefaults.standard.string(forKey: "userName") != nil {
            userName =  UserDefaults.standard.string(forKey: "userName")!
        }
        var recordsArr = UserDefaults.standard.array(forKey: "recordsArr") as? [[String]]
        if score >= Int((recordsArr?[9][0])!)! {
            recordsArr?[9] = [String(score), userName]
            recordsArr!.sort(by: { $0[0] > $1[0] })
            UserDefaults.standard.set(recordsArr, forKey: "recordsArr")
        }
    }
}
