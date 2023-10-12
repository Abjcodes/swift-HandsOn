//
//  SegmentedController.swift
//  schoolSystem
//
//  Created by P10 on 12/10/23.
//

import Foundation
import UIKit

extension ViewController{
    func setupSegmentedControl() {
            // Set up the segmented control with initial values
            filterSegmentedControl.removeAllSegments()
            filterSegmentedControl.insertSegment(withTitle: "All", at: 0, animated: false)
            filterSegmentedControl.insertSegment(withTitle: "Students", at: 1, animated: false)
            filterSegmentedControl.insertSegment(withTitle: "Teachers", at: 2, animated: false)
            filterSegmentedControl.selectedSegmentIndex = 0 // Initial selection
            filterSegmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
        
        @objc func segmentedControlValueChanged() {
            filterData()
    }
    
    func filterData() {
        let selectedSegmentIndex = filterSegmentedControl.selectedSegmentIndex
        
        switch selectedSegmentIndex {
        case 0:
            // Show all persons
            filteredPersons = persons
        case 1:
            // Filter for students
            filteredPersons = persons.filter { $0.student != nil }
        case 2:
            // Filter for teachers
            filteredPersons = persons.filter { $0.teacher != nil }
        default:
            break
        }
        
        tableView.reloadData()
    }
}
