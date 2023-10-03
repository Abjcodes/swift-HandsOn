//
//  ViewController.swift
//  Gestures
//
//  Created by P10 on 03/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create three custom views
        let view1 = CustomView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        let view2 = CustomView(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
        let view3 = CustomView(frame: CGRect(x: 250, y: 100, width: 100, height: 100))

        // Add gesture recognizers to each view
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))

        view1.addGestureRecognizer(tapGestureRecognizer)
        view2.addGestureRecognizer(swipeGestureRecognizer)
        view3.addGestureRecognizer(pinchGestureRecognizer)

        // Add views to the main view
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view as? CustomView {
            view.backgroundColor = .green
        }
    }

    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if let view = sender.view as? CustomView {
            view.backgroundColor = .blue
        }
    }

    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view as? CustomView {
            let scale = sender.scale
            view.transform = view.transform.scaledBy(x: scale, y: scale)
            sender.scale = 1.0
        }
    }
}

class CustomView: UIView {
    // Custom view class
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

