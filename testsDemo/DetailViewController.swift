//
//  DetailViewController.swift
//  testsDemo
//
//  Created by Itsuki on 2023/10/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    var fullName: String?
    
    @IBOutlet weak var fullNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.text = fullName
    }
    

}
