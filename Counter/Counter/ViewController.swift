//
//  ViewController.swift
//  Counter
//
//  Created by P10 on 03/10/23.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    @IBOutlet weak var tapRegion: UIView!
    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        
        tapRegion.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        count+=1
        counterLabel.text = String(count)
    }

    @IBAction func resetOnTap(_ sender: Any) {
        counterLabel.text = "0"
        count = 0
    }
}

