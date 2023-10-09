//
//  ViewController.swift
//  Delegates
//
//  Created by P10 on 03/10/23.
//

import UIKit

class ViewController: UIViewController, ListSelectDelegate {

    @IBOutlet weak var selectedValueOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonOnTap(_ sender: Any) {
        let selectVC = storyboard?.instantiateViewController(withIdentifier:"selectionVC") as! SelectionScreen
            selectVC.listSelectDelegate = self
            navigationController?.present(selectVC, animated: true)
            print("Button tapped")
    }
    
    func onChoiceSelect(label: String) {
        selectedValueOutlet.text = label
        print(label)
    }
    
}

