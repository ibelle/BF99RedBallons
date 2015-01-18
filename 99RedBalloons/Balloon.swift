//
//  Balloon.swift
//  99RedBalloons
//
//  Created by HUGE | Isaiah Belle on 1/17/15.
//  Copyright (c) 2015 IsaiahBelleDigital. All rights reserved.
//

import Foundation
import UIKit

struct Balloon : Printable {
    //Properties
    var number = 0
    var image = UIImage(named:"")
    var description: String {
        return "Balloon: Number-\(number),Image-\(image)"
}
}