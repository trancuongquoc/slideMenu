//
//  ContainerView.swift
//  slideMenu
//
//  Created by quocuong on 6/6/18.
//  Copyright © 2018 quoccuong. All rights reserved.
//

import UIKit

protocol ContainerViewDelegate: class {
    func unhideSideMenu()
}
class ContainerView: UIViewController {
    
    weak var delegate: ContainerViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showSideMenu(_ sender: UIBarButtonItem) {
        delegate?.unhideSideMenu()
    }
    
}
