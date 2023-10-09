//
//  ViewController.swift
//  swipe
//
//  Created by P10 on 04/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewOutlet: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeGestureRecognizer.direction = .left
//        viewOutlet.addGestureRecognizer(swipeGestureRecognizer)
        self.view.addGestureRecognizer(swipeGestureRecognizer)
}
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
            print("Swiped")
            performSegue(withIdentifier: "swipeSegue", sender: self)
    }


}

