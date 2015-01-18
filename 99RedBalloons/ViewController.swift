//
//  ViewController.swift
//  99RedBalloons
//
//  Created by HUGE | Isaiah Belle on 1/17/15.
//  Copyright (c) 2015 IsaiahBelleDigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var balloonImageView: UIImageView!
    @IBOutlet weak var balloonLabel: UILabel!
    var currentBalloonIndex:Int=0
    var myBalloons: [Balloon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myBalloons = buildBalloonArray()
        println(myBalloons)
        for (balloon) in myBalloons {
            println("\(balloon))")
        }
        
        setCurrentBalloon(myBalloons.first!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func nextBalloonButtonPressed(sender: UIBarButtonItem) {
        var randomNumber:Int
        do{
            randomNumber = Int(arc4random_uniform(UInt32(myBalloons.count)))
        } while randomNumber == currentBalloonIndex
        currentBalloonIndex = randomNumber
        var nextBalloon = myBalloons[currentBalloonIndex]
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                self.setCurrentBalloon(self.myBalloons[randomNumber])
            },
            completion: {
                (finished: Bool) -> () in
        })

    }
    
    
    func buildBalloonArray() -> [Balloon]{
        var balloonCollection :[Balloon] = [Balloon]()
        for  var i=1; i<100; i++ {
            
            var newBalloon = Balloon()
            newBalloon.number = i
            let balloonNum = 1 + Int(arc4random_uniform(UInt32(5)))
            
            switch balloonNum {
            case 1:
                newBalloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
               newBalloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                newBalloon.image = UIImage(named: "RedBalloon3.jpg")
            case 4:
                newBalloon.image = UIImage(named: "RedBalloon4.jpg")
            default:
                newBalloon.image = UIImage(named: "BerlinTVTower.jpg")
            }
            balloonCollection.append(newBalloon)
        }
        return balloonCollection
    }
    
    
    func setCurrentBalloon(myBalloon: Balloon){
        balloonLabel.text = "Now Showing Balloon #\(myBalloon.number)"
        balloonLabel.hidden = false
        balloonImageView.image = myBalloon.image
    }
}

