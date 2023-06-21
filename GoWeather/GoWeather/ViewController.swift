//
//  ViewController.swift
//  GoWeather
//
//  Created by Grigorii Rassadnikov on 21.06.2023.
//

import UIKit
import Modules

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        let modules = Modules()
        print(modules.text)
        
    }


}
