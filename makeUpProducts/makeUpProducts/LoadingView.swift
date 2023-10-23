//
//  LoadingView.swift
//  makeUpProducts
//
//  Created by P10 on 23/10/23.
//

import UIKit

class LoadingView: UIView {
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0, alpha: 0.6)
        activityIndicator.color = .white
        addSubview(activityIndicator)
        activityIndicator.center = center
        activityIndicator.hidesWhenStopped = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func startLoading() {
        activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
        isHidden = true
    }
}

