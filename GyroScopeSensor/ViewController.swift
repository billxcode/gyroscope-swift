//
//  ViewController.swift
//  GyroScopeSensor
//
//  Created by Bill Tanthowi Jauhari on 13/07/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xGyro: UILabel!
    @IBOutlet weak var yGyro: UILabel!
    @IBOutlet weak var zGyro: UILabel!
    
    var motion = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GyroExe()
        // Do any additional setup after loading the view.
    }
    
    private func GyroExe()
    {
        motion.gyroUpdateInterval = 0.5
        motion.startGyroUpdates(to: OperationQueue.current!) { (data, error) in
            
            if let trueData = data {
                let x = trueData.rotationRate.x
                let y = trueData.rotationRate.y
                let z = trueData.rotationRate.z
                
                self.xGyro.text = String(Float(x))
                self.yGyro.text = String(Float(y))
                self.zGyro.text = String(Float(z))
            }else {
                print("wrong")
            }
            
        }
    }


}

