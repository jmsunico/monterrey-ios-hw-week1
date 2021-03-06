//
//  ViewController.swift
//  accelerometer_test
//
//  Created by José-María Súnico on 20160623.
//  Copyright © 2016 José-María Súnico. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

	@IBOutlet weak var labelX: UILabel!
	@IBOutlet weak var labelY: UILabel!
	@IBOutlet weak var labelZ: UILabel!
	
	private let accHandler = CMMotionManager()
	private let accDataQueue = NSOperationQueue()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		if accHandler.accelerometerAvailable{
			accHandler.accelerometerUpdateInterval = 1.0/10.0
			accHandler.startAccelerometerUpdatesToQueue(accDataQueue, withHandler: {
					data, error in
				if error != nil {
					self.accHandler.stopAccelerometerUpdates()
					
				} else {
					dispatch_async(dispatch_get_main_queue(),
						{
							self.labelX.text = String(data!.acceleration.x)
							self.labelY.text = String(data!.acceleration.y)
							self.labelZ.text = String(data!.acceleration.z)
						})
				}
				})
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

