//
//  ViewController.swift
//  Delegates
//
//  Created by P10 on 03/10/23.
//

import UIKit



class ViewController: UIViewController, ListSelectDelegate {

    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonOnTap(_ sender: Any) {
            let selectVC = storyboard?.instantiateViewController(withIdentifier:"selectionVC") as! selectionScreen
            selectVC.listSelectDelegate = self
            navigationController?.present(selectVC, animated: true)
            print("Button tapped")
    }
    
    func onTapChoice(label: String) {
        labelOutlet.text = label
        print(label)
    }
    
}

