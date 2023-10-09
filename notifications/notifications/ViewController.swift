//
//  ViewController.swift
//  notifications
//
//  Created by P10 on 04/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: Notification.Name("CustomNotification"), object: nil)
    }
    
    @IBAction func incrementBtnOnTap(_ sender: Any) {
        count += 1
        counterLabel.text = "\(count)"
        NotificationCenter.default.post(name: Notification.Name("CustomNotification"), object: nil)
    }
    
    @objc func handleNotification() {
        messageLabel.text = "Notification Received"
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] _ in
                self?.messageLabel.text = ""
        }
    }
    
}

