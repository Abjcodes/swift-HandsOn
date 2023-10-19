//
//  BGgradient.swift
//  login
//
//  Created by P10 on 19/10/23.
//

import Foundation
import UIKit

extension ViewController{
          
    func gradientSetup() {

         // basic setup
         view.backgroundColor = .white
         navigationItem.title = "Gradient View"

         // Create a new gradient layer
         let gradientLayer = CAGradientLayer()
         // Set the colors and locations for the gradient layer
         gradientLayer.colors = [UIColor.white.cgColor, UIColor.lightGray.cgColor]
         gradientLayer.locations = [0.0, 1.0]

         // Set the start and end points for the gradient layer
         gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
         gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

         // Set the frame to the layer
         gradientLayer.frame = view.frame

         // Add the gradient layer as a sublayer to the background view
         view.layer.insertSublayer(gradientLayer, at: 0)
      }
   }
