//
//  ContainerView.swift
//  slideMenu
//
//  Created by quocuong on 6/6/18.
//  Copyright © 2018 quoccuong. All rights reserved.
//

import UIKit


class ContainerView: UIViewController {
    
    var onCompletion: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sideMenuButtonTapped(_ sender: Any) {
        onCompletion?()
    }
}
