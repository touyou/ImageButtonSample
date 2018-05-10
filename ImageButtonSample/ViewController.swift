//
//  ViewController.swift
//  ImageButtonSample
//
//  Created by 藤井陽介 on 2018/05/10.
//  Copyright © 2018 touyou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapButton(_ sender: ImageButton) {

        imageView.image = sender.imageView?.image
    }

}

