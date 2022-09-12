//
//  ViewController.swift
//  Car
//
//  Created by Арсений on 10.09.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myCar: UIImageView!
    

    override func viewDidLoad() {

        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { Timer in
            let plate = UIView()
            plate.backgroundColor = .white
            plate.frame  = CGRect(x: 195, y: -100, width: 25, height: 100)
            self.view.addSubview(plate)
            UIView.animate(withDuration: 4,
                                  delay: 0,
                           options: [.curveLinear]) {
                plate.frame.origin.y += 1000
                   } completion: { isCompleted in
                       plate.removeFromSuperview()
                   }

        }
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { Timerr in
            let anyCar = UIImageView(image: UIImage(named: "anyCar"))
            var set = Int.random(in: 0...1)
            switch set{
            case 0:
                anyCar.frame  = CGRect(x: 66, y: -200, width: 100, height: 200)
            default:
                
                anyCar.frame  = CGRect(x: 249, y: -200, width: 100, height: 200)
            }
            self.view.addSubview(anyCar)
          
            UIView.animate(withDuration: 4,
                                  delay: 0,
                           options: [.curveLinear]) {
                anyCar.frame.origin.y += 1300
                   } completion: { isCompleted in
                       anyCar.removeFromSuperview()
//                       timerrr.invalidate()
                   }

        }
    }
    
}

